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

/* Global typedef */

/* Global define */

/* LED0通锟斤拷rt锟斤拷pin锟斤拷锟斤拷锟接匡拷锟斤拷锟斤拷  */
#define LED0_PIN  18   //PC3

/* Global Variable */

/*********************************************************************
 * @fn      LED1_BLINK_INIT
 *
 * @brief   LED1Íš¹ýÖ±œÓµ÷ÓÃµ×²ãÇý¶¯
 *
 * @return  none
 */
void LED1_BLINK_INIT(void)
{
    GPIO_InitTypeDef GPIO_InitStructure={0};
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_0;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_Init(GPIOA, &GPIO_InitStructure);
}

/*********************************************************************
 * @fn      main
 *
 * @brief   mainÖ»ÊÇÒ»žöÏß³ÌÖ®Ò»£¬³ýŽËÖ®Íâ»¹ÓÐtshell,idle
 *          ±ŸmainÖ»ÊÇÒ»žöLEDÉÁËž£¬mainÏß³ÌµÄ×¢²áÔÚrtthread_startupÖÐ£¬tshellÊ¹ÓÃÁËŽ®¿Ú
 *          œÓÊÕÖÐ¶Ï£¬ÖÐ¶ÏÕ»ºÍÏß³ÌÕ»Ê¹ÓÃ·Ö¿ª.
 *
 * @return  none
 */
int main(void)
{
    rt_kprintf("\r\n MCU: CH32V307\r\n");
	rt_kprintf(" SysClk: %dHz\r\n",SystemCoreClock);
    rt_kprintf(" www.wch.cn\r\n");
	LED1_BLINK_INIT();

	GPIO_ResetBits(GPIOA,GPIO_Pin_0);
	while(1)
	{
	    GPIO_SetBits(GPIOA,GPIO_Pin_0);
	    rt_thread_mdelay(500);
	    GPIO_ResetBits(GPIOA,GPIO_Pin_0);
	    rt_thread_mdelay(500);
	}
}

/*********************************************************************
 * @fn      led
 *
 * @brief   ²âÊÔÊ¹ÓÃÇý¶¯œÓ¿Ú²Ù×÷I/O¿Ú
 *
 * @return  none
 */
int led(void)
{
    rt_uint8_t count;

    rt_pin_mode(LED0_PIN, PIN_MODE_OUTPUT);
    rt_kprintf("led_SP:%08x\r\n",__get_SP());
    for(count = 0 ; count < 10 ;count++)
    {
        rt_pin_write(LED0_PIN, PIN_LOW);
        rt_kprintf("led on, count : %d\r\n", count);
        rt_thread_mdelay(500);

        rt_pin_write(LED0_PIN, PIN_HIGH);
        rt_kprintf("led off\r\n");
        rt_thread_mdelay(500);
    }
    return 0;
}

MSH_CMD_EXPORT(led,  led sample by using I/O drivers);



