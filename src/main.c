/********************************** (C) COPYRIGHT *******************************
* File Name          : main.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2020/04/30
* Description        : Main program body.
*******************************************************************************/
#include "ch32v30x.h"
#include <rtthread.h>
#include <rthw.h>
#include "drivers/pin.h"

#include <math.h>
#include <string.h>

/* Global typedef */

/* Global define */

/* LED0通锟斤拷rt锟斤拷pin锟斤拷锟斤拷锟接匡拷锟斤拷锟斤拷  */
#define LED0_PIN  18   //PC3

/* Global Variable */

/*********************************************************************
 * @fn      LED1_BLINK_INIT
 *
 * @brief   LED1通锟斤拷直锟接碉拷锟矫底诧拷锟斤拷锟斤拷
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
 * @brief   main只锟斤拷一锟斤拷锟竭筹拷之一锟斤拷锟斤拷锟斤拷之锟解还锟斤拷tshell,idle
 *          锟斤拷main只锟斤拷一锟斤拷LED锟斤拷烁锟斤拷main锟竭程碉拷注锟斤拷锟斤拷rtthread_startup锟叫ｏ拷tshell使锟斤拷锟剿达拷锟斤拷
 *          锟斤拷锟斤拷卸希锟斤拷卸锟秸伙拷锟斤拷叱锟秸皇癸拷梅挚锟斤拷锟阶拷锟斤拷锟叫讹拷时锟斤拷16caller锟侥达拷锟斤拷锟斤拷要压锟斤拷锟竭筹拷栈锟斤拷
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
 * @brief   锟斤拷锟斤拷使锟斤拷锟斤拷锟斤拷锟接口诧拷锟斤拷I/O锟斤拷
 *
 * @return  none
 */
int led(void)
{
    rt_uint8_t count;

    rt_pin_mode(LED0_PIN, PIN_MODE_OUTPUT);
    printf("led_SP:%08x\r\n",__get_SP());
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


static float tsin[2048];
static float tcos[2048];

static float precalc_sin(float v)
{
    int idx = v / (2*M_PI) * 2048;
    int i = idx % 2048;
    return tsin[idx];
}

static float precalc_cos(float v)
{
    int idx = v / (2*M_PI) * 2048;
    int i = idx % 2048;
    return tcos[i];
}

void precalc()
{
    for (int i=0; i<2048; i++) {
        tsin[i] = sin(2 * i * M_PI / 2048);
        tcos[i] = cos(2 * i * M_PI / 2048);
    }
}


int donut(void)
{
    int k;
    float A=0, B=0, i, j;
    static float z[1760];
    static char b[1760];
    printf("\x1b[2J"); 
    precalc();
    for(; ; ) {
        memset(b,32,1760);
        memset(z,0,7040);
        for(j=0; 6.28f>j; j+=0.07f) {
            for(i=0; 6.28f >i; i+=0.02f) {
                float sini=precalc_sin(i),
                      cosj=precalc_cos(j),
                      sinA=precalc_sin(A),
                      sinj=precalc_sin(j),
                      cosA=precalc_cos(A),
                      cosj2=cosj+2,
                      mess=1.0f/(sini*cosj2*sinA+sinj*cosA+5),
                      cosi=precalc_cos(i),
                      cosB=precalc_cos(B),
                      sinB=precalc_sin(B),
                      t=sini*cosj2*cosA-sinj* sinA;
                int x=40+30*mess*(cosi*cosj2*cosB-t*sinB),
                    y= 12+15*mess*(cosi*cosj2*sinB +t*cosB),
                    o=x+80*y,
                    N=8*((sinj*sinA-sini*cosj*cosA)*cosB-sini*cosj*sinA-sinj*cosA-cosi *cosj*sinB);
                if(22>y&&y>0&&x>0&&80>x&&mess>z[o]){
                    z[o]=mess;
                    b[o]=".,-~:;=!*#$@"[N>0?N:0];
                }
            }
        }
        printf("\x1b[d");
        for(k=0; 1761>k; k++)
            putchar(k%80?b[k]:10);
        A+=0.04;
        B+= 0.02;
        fflush(stdout);
    }
    return 0;
}

MSH_CMD_EXPORT(donut, show a donut);
