/********************************** (C) COPYRIGHT *******************************
 * File Name          : main.c
 * Author             : WCH
 * Version            : V1.0.0
 * Date               : 2020/04/30
 * Description        : Main program body.
 * Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
 * SPDX-License-Identifier: Apache-2.0
 *******************************************************************************/
#include "ch32v30x.h"
#include <rtthread.h>
#include <rthw.h>
#include "drivers/pin.h"

#include "usbd_core.h"
#include "usbd_cdc.h"

#include <dfs.h>
#include <dfs_fs.h>
#include <dfs_romfs.h>

/* Global typedef */

/* Global define */

#define LED0_PIN 18 // PC3

/* Global Variable */

void LED1_BLINK_INIT(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = { 0 };
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
}

void usb_dc_low_level_init(void)
{
    RCC_USBCLK48MConfig(RCC_USBCLK48MCLKSource_USBPHY);
    RCC_USBHSPLLCLKConfig(RCC_HSBHSPLLCLKSource_HSE);
    RCC_USBHSConfig(RCC_USBPLL_Div2);
    RCC_USBHSPLLCKREFCLKConfig(RCC_USBHSPLLCKREFCLK_4M);
    RCC_USBHSPHYPLLALIVEcmd(ENABLE);
#ifdef CONFIG_USB_HS
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_USBHS, ENABLE);
#else
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_OTG_FS, ENABLE);
#endif

    rt_thread_mdelay(100);
#ifndef CONFIG_USB_HS
    // EXTEN->EXTEN_CTR |= EXTEN_USBD_PU_EN;
    NVIC_EnableIRQ(OTG_FS_IRQn);
#else
    NVIC_EnableIRQ(USBHS_IRQn);
#endif
}

static void usb_thread(void *unused)
{
    (void)unused;
    extern void cdc_acm_init(void);
    extern void cdc_acm_data_send_with_dtr_test();
    cdc_acm_init();

    while (1) {
        if (usb_device_is_configured()) {
            cdc_acm_data_send_with_dtr_test();
        }
        rt_thread_mdelay(500);
    }
}

int main(void)
{
    rt_kprintf("\n MCU: CH32V307\n");
    rt_kprintf(" SysClk: %dHz\n", SystemCoreClock);
    rt_kprintf(" www.wch.cn\n\n");
    LED1_BLINK_INIT();

    if (dfs_mount(RT_NULL, "/", "rom", 0, &(romfs_root)) != 0)
        rt_kprintf("rom mount to '/' failed!\n");

    rt_thread_t usbtask = rt_thread_create("usb", usb_thread, RT_NULL, 4096, RT_MAIN_THREAD_PRIORITY + 1, 10);
    rt_thread_startup(usbtask);

    GPIO_ResetBits(GPIOA, GPIO_Pin_0);
    while (1) {
        GPIO_WriteBit(GPIOA, GPIO_Pin_0, !GPIO_ReadInputDataBit(GPIOA, GPIO_Pin_0));
        rt_thread_mdelay(500);
    }
}

int led(void)
{
    rt_uint8_t count;

    rt_pin_mode(LED0_PIN, PIN_MODE_OUTPUT);
    rt_kprintf("led_SP:%08x\n", __get_SP());
    for (count = 0; count < 10; count++) {
        rt_pin_write(LED0_PIN, PIN_LOW);
        rt_kprintf("led on, count : %d\n", count);
        rt_thread_mdelay(500);

        rt_pin_write(LED0_PIN, PIN_HIGH);
        rt_kprintf("led off\n");
        rt_thread_mdelay(500);
    }
    return 0;
}

MSH_CMD_EXPORT(led, led sample by using I/O drivers);
