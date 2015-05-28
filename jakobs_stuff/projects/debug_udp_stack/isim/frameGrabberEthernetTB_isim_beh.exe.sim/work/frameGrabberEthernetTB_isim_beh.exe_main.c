/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *WORK_P_2564502860;
char *WORK_P_2272043381;
char *WORK_P_2661982719;
char *WORK_P_1391133289;
char *IEEE_P_1242562249;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    work_p_2564502860_init();
    work_p_2272043381_init();
    work_p_2661982719_init();
    work_p_1391133289_init();
    ieee_p_1242562249_init();
    work_a_3615315794_3212880686_init();
    work_a_1074496737_2372691052_init();


    xsi_register_tops("work_a_1074496737_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    WORK_P_2564502860 = xsi_get_engine_memory("work_p_2564502860");
    WORK_P_2272043381 = xsi_get_engine_memory("work_p_2272043381");
    WORK_P_2661982719 = xsi_get_engine_memory("work_p_2661982719");
    WORK_P_1391133289 = xsi_get_engine_memory("work_p_1391133289");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");

    return xsi_run_simulation(argc, argv);

}
