/********************************** (C) COPYRIGHT *******************************
* File Name          : ch32v30x_it.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2021/06/06
* Description        : Main Interrupt Service Routines.
*******************************************************************************/

#include "ch32v30x_it.h"
#include "debug.h"

void NMI_Handler(void) __attribute__((naked));
void HardFault_Handler(void) __attribute__((naked));

void NMI_Handler(void) { __asm__ volatile("call doNMI_Handler; mret"); }
void HardFault_Handler(void) { __asm__ volatile("call doHardFault_Handler; mret"); }

/*******************************************************************************
* Function Name  : NMI_Handler
* Description    : This function handles NMI exception.
* Input          : None
* Return         : None
*******************************************************************************/
void doNMI_Handler(void)
{
}

/*******************************************************************************
* Function Name  : HardFault_Handler
* Description    : This function handles Hard Fault exception.
* Input          : None
* Return         : None
*******************************************************************************/
void doHardFault_Handler(void)
{
    while(1);
}
