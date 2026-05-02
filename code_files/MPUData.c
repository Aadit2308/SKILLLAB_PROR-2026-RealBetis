/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include "xparameters.h"
#include "xiic.h"
#include "xil_printf.h"
#include "sleep.h"
#include <math.h>
#include <stdlib.h>   // for abs()

#define MPU6050_ADDR 0x68
#define PWR_MGMT_1   0x6B
#define ACCEL_CONFIG 0x1C
#define START_REG    0x3B   // accel start register

XIic Iic;

int main()
{
    XIic_Config *Config;
    int status;

    u8 recv_buf[14];
    u8 reg;
    u8 data[2];

    xil_printf("MPU6050 Roll & Pitch Test\r\n");

    // ---------------- I2C INIT ----------------
    Config = XIic_LookupConfig(0);
    if (Config == NULL) {
        xil_printf("IIC config not found\r\n");
        return 0;
    }

    status = XIic_CfgInitialize(&Iic, Config, Config->BaseAddress);
    if (status != XST_SUCCESS) {
        xil_printf("IIC init failed\r\n");
        return 0;
    }

    XIic_Start(&Iic);

    // ---------------- WAKE MPU6050 ----------------
    data[0] = PWR_MGMT_1;
    data[1] = 0x00;

    status = XIic_Send(Iic.BaseAddress, MPU6050_ADDR, data, 2, XIIC_STOP);
    if (status != 2) {
        xil_printf("MPU wakeup failed\r\n");
    }

    usleep(10000);

    // ---------------- SET ACCEL RANGE ±2g ----------------
    data[0] = ACCEL_CONFIG;
    data[1] = 0x00;

    XIic_Send(Iic.BaseAddress, MPU6050_ADDR, data, 2, XIIC_STOP);

    usleep(10000);

    // ---------------- MAIN LOOP ----------------
    while(1)
    {
        reg = START_REG;

        // Set start register
        status = XIic_Send(Iic.BaseAddress, MPU6050_ADDR, &reg, 1, XIIC_STOP);
        if (status != 1) {
            xil_printf("Write failed\r\n");
            continue;
        }

        // Read 14 bytes
        status = XIic_Recv(Iic.BaseAddress, MPU6050_ADDR, recv_buf, 14, XIIC_STOP);
        if (status != 14) {
            xil_printf("Read failed\r\n");
            continue;
        }

        // -------- ACCEL --------
        short accel_x = (recv_buf[0] << 8) | recv_buf[1];
        short accel_y = (recv_buf[2] << 8) | recv_buf[3];
        short accel_z = (recv_buf[4] << 8) | recv_buf[5];

        // -------- GYRO --------
        short gyro_x = (recv_buf[8]  << 8) | recv_buf[9];
        short gyro_y = (recv_buf[10] << 8) | recv_buf[11];
        short gyro_z = (recv_buf[12] << 8) | recv_buf[13];

        // -------- Convert to g --------
        float ax = accel_x / 16384.0;
        float ay = accel_y / 16384.0;
        float az = accel_z / 16384.0;

        // -------- Compute Roll & Pitch --------
        float roll  = atan2(ay, az) * 180.0 / M_PI;
        float pitch = atan2(-ax, sqrt(ay*ay + az*az)) * 180.0 / M_PI;

        // -------- Convert float → int for printing --------
        int roll_i  = (int)(roll * 100);
        int pitch_i = (int)(pitch * 100);

        // -------- Print --------
        xil_printf("AX:%d AY:%d AZ:%d | GX:%d GY:%d GZ:%d | ",
                   accel_x, accel_y, accel_z,
                   gyro_x, gyro_y, gyro_z);

        xil_printf("Roll:%d.%02d Pitch:%d.%02d\r\n",
                   roll_i/100, abs(roll_i%100),
                   pitch_i/100, abs(pitch_i%100));

        usleep(200000); // 200 ms
    }
}
