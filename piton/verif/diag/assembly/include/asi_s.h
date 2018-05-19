// Modified by Princeton University on June 9th, 2015
/*
* ========== Copyright Header Begin ==========================================
* 
* OpenSPARC T1 Processor File: asi_s.h
* Copyright (c) 2006 Sun Microsystems, Inc.  All Rights Reserved.
* DO NOT ALTER OR REMOVE COPYRIGHT NOTICES.
* 
* The above named program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License version 2 as published by the Free Software Foundation.
* 
* The above named program is distributed in the hope that it will be 
* useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
* 
* You should have received a copy of the GNU General Public
* License along with this work; if not, write to the Free Software
* Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
* 
* ========== Copyright Header End ============================================
*/

#define ASI_NUCLEUS                         	0x04
#define ASI_NUCLEUS_LITTLE                  	0x0c
#define ASI_AS_IF_USER_PRIMARY              	0x10
#define ASI_AS_IF_USER_SECONDARY            	0x11
#define ASI_PHYS_USE_EC                     	0x14
#define ASI_PHYS_BYPASS_EC_WITH_EBIT        	0x15
#define ASI_AS_IF_USER_PRIMARY_LITTLE       	0x1e
#define ASI_AS_IF_USER_SECONDARY_LITTLE     	0x1f
#define ASI_PHYS_USE_EC_LITTLE              	0x1c
#define ASI_PHYS_BYPASS_EC_WITH_EBIT_LITTLE 	0x1d
#define ASI_NUCLEUS_QUAD_LDD                	0x24
#define ASI_NUCLEUS_QUAD_LDD_LITTLE         	0x2c
#define ASI_PCACHE_DATA_STATUS              	0x30
#define ASI_PCACHE_DATA                     	0x31
#define ASI_PCACHE_TAG                      	0x32
#define ASI_PCACHE_SNOOP_TAG                	0x33
#define ASI_WCACHE_DATA_STATUS              	0x38
#define ASI_WCACHE_DATA                     	0x39
#define ASI_WCACHE_TAG                      	0x3a
#define ASI_WCACHE_SNOOP_TAG                	0x3b
#define ASI_SRAM_TEST_INIT                      ASI_SRAM_FAST_INIT	
#define ASI_DCACHE_INVALIDATE               	0x42
#define ASI_DCACHE_UTAGS                    	0x43
#define ASI_ERROR_INJECT_REG                    0x43
#define ASI_ERROR_INJECT_ADDR                      0x00
#define ASI_DCACHE_SNOOP_TAG                	0x44
#define ASI_DCU_CONTROL_REG                 	0x45
#define ASI_DCACHE_DATA                     	0x46
#define ASI_DCACHE_TAG                      	0x47
#define ASI_INTR_DISPATCH_STATUS            	0x48
#define ASI_INTR_RECEIVE                    	0x49
/* leave safari defs here for backward compatability */
#define ASI_SAFARI_CONFIG_REG               	0x4a
#define ASI_SAFARI_ADDR_REG                 	0x4a
#define ASI_JBU_CONFIG_REG               	0x4a
#define ASI_UPA_CONFIG_REG			0x4a
#define ASI_SAFARI_ADDR_REG_VAL             	0x008
#define ASI_ESTATE_ERROR_EN_REG             	0x4b
#define ASI_ASYNC_FAULT_STATUS              	0x4c
#define ASI_ASYNC_FAULT_ADDR                	0x4d
#define ASI_ECACHE_TAG                      	0x4e
#define ASI_ECACHE_FLUSH                      	0x4e
#define ASI_IMMU                            	0x50
#define ASI_IMMU_TAG_TARGET_REG             	0x50
#define ASI_IMMU_TAG_TARGET_REG_VAL         	0x000
#define ASI_IMMU_SFSR                       	0x50
#define ASI_IMMU_SFSR_VAL                   	0x018
#define ASI_IMMU_TSB_BASE                   	0x50
#define ASI_IMMU_TSB_BASE_VAL               	0x028
#define ASI_IMMU_TAG_ACCESS                 	0x50
#define ASI_IMMU_TAG_ACCESS_VAL             	0x030
#define ASI_IMMU_TSB_PEXT_REG               	0x50
#define ASI_IMMU_TSB_PEXT_REG_VAL           	0x048
#define ASI_IMMU_TSB_NEXT_REG               	0x50
#define ASI_IMMU_TSB_NEXT_REG_VAL           	0x058
#define ASI_IMMU_TSB_8KB_PTR_REG            	0x51
#define ASI_IMMU_TSB_64KB_PTR_REG           	0x52
#define ASI_ID_REG                          	0x53
#define ASI_DEVICE_ID                       	0x53
#define ASI_DEVICE_ID_VAL                   	0x000
#define ASI_SERIAL_ID                       	0x53
#define ASI_SERIAL_ID_VAL                   	0x008
#define ASI_ITLB_DATA_IN_REG                	0x54
#define ASI_ITLB_DATA_ACCESS_REG            	0x55
#define ASI_ITLB_TAG_READ_REG               	0x56
#define ASI_IMMU_DEMAP                      	0x57
#define ASI_DMMU                            	0x58
#define ASI_DMMU_TAG_TARGET_REG             	0x58
#define ASI_DMMU_TAG_TARGET_REG_VAL         	   0x000
#define ASI_PRIMARY_CONTEXT_REG             	0x21
#define ASI_PRIMARY_CONTEXT_REG_VAL          	   0x008
#define ASI_SECONDARY_CONTEXT_REG           	0x21
#define ASI_SECONDARY_CONTEXT_REG_VAL       	   0x010

#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P		0x22
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S		0x23
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_P_LITTLE	0x2A
#define ASI_AS_IF_USER_BLK_INIT_ST_QUAD_LDD_S_LITTLE	0x2B

#define ASI_DMMU_SFSR                       	0x58
#define ASI_DMMU_SFSR_VAL                   	   0x018
#define ASI_DMMU_SFAR                       	0x58
#define ASI_DMMU_SFAR_VAL                   	   0x020
#define ASI_DMMU_TSB_BASE                   	0x58
#define ASI_DMMU_TSB_BASE_VAL               	   0x028
#define ASI_DMMU_TAG_ACCESS                 	0x58
#define ASI_DMMU_TAG_ACCESS_VAL             	0x030
#define ASI_DMMU_VA_WATCHPOINT_REG          	0x58
#define ASI_DMMU_VA_WATCHPOINT_REG_VAL      	0x038
#define ASI_DMMU_PA_WATCHPOINT_REG          	0x58
#define ASI_DMMU_PA_WATCHPOINT_REG_VAL      	0x040
#define ASI_DMMU_TSB_PEXT_REG               	0x58
#define ASI_DMMU_TSB_PEXT_REG_VAL           	0x048
#define ASI_DMMU_TSB_SEXT_REG               	0x58
#define ASI_DMMU_TSB_SEXT_REG_VAL           	0x050
#define ASI_DMMU_TSB_NEXT_REG               	0x58
#define ASI_DMMU_TSB_NEXT_REG_VAL           	0x058
#define ASI_DMMU_TSB_8KB_PTR_REG            	0x59
#define ASI_DMMU_TSB_64KB_PTR_REG           	0x5a
#define ASI_DMMU_TSB_DIRECT_PTR_REG         	0x5b
#define ASI_DTLB_DATA_IN_REG                	0x5c
#define ASI_DTLB_DATA_ACCESS_REG            	0x5d
#define ASI_DTLB_TAG_READ_REG               	0x5e
#define ASI_DMMU_DEMAP                      	0x5f
#define ASI_IIU_INST_TRAP                   	0x60
#define ASI_FDIV_SEED                       	0x64
#define ASI_ICACHE_INSTR                    	0x66
#define ASI_ICACHE_TAG                      	0x67
#define ASI_ICACHE_SNOOP_TAG                	0x68
#define ASI_BRANCH_PREDICTION_ARRAY         	0x6f
#define ASI_BLOCK_AS_IF_USER_PRIMARY        	0x16
#define ASI_BLOCK_AS_IF_USER_SECONDARY      	0x17

#define ASI_SWVR_INTR_RECEIVE           0x72
#define ASI_SWVR_UDB_INTR_W             0x73
#define ASI_SWVR_UDB_INTR_R             0x74

#define ASI_MCU_TIM1_CTRL_REG               	0x72
#define ASI_MCU_TIM1_CTRL_REG_VAL           	0x000
#define ASI_MCU_TIM2_CTRL_REG               	0x72
#define ASI_MCU_TIM2_CTRL_REG_VAL           	0x008
#define ASI_MCU_ADDR_DEC_REG0               	0x72
#define ASI_MCU_ADDR_DEC_REG0_VAL           	0x010
#define ASI_MCU_ADDR_DEC_REG1               	0x72
#define ASI_MCU_ADDR_DEC_REG1_VAL           	0x018
#define ASI_MCU_ADDR_DEC_REG2               	0x72
#define ASI_MCU_ADDR_DEC_REG2_VAL           	0x020
#define ASI_MCU_ADDR_DEC_REG3               	0x72
#define ASI_MCU_ADDR_DEC_REG3_VAL           	0x028
#define ASI_MCU_ADDR_CTRL_REG               	0x72
#define ASI_MCU_ADDR_CTRL_REG_VAL           	0x030
#define ASI_MCU_TIM3_CTRL_REG               	0x72
#define ASI_MCU_TIM3_CTRL_REG_VAL           	0x038
#define ASI_MCU_TIM4_CTRL_REG               	0x72
#define ASI_MCU_TIM4_CTRL_REG_VAL           	0x040
#define ASI_ECACHE_DATA                     	0x74
#define ASI_ECACHE_CTRL                     	0x75
#define ASI_ECACHE_W                        	0x76
#define ASI_SIU_ERROR_WRITE_REG             	0x77
#define ASI_INTR_W 		            	0x77
#define ASI_INTR_DATA0_W                    	0x77
#define ASI_INTR_DATA0_W_VAL                	0x040
#define ASI_INTR_DATA1_W                    	0x77
#define ASI_INTR_DATA1_W_VAL                	0x048
#define ASI_INTR_DATA2_W                    	0x77
#define ASI_INTR_DATA2_W_VAL                	0x050
#define ASI_INTR_DATA3_W                    	0x77
#define ASI_INTR_DATA3_W_VAL                	0x058
#define ASI_INTR_DATA4_W                    	0x77
#define ASI_INTR_DATA4_W_VAL                	0x060
#define ASI_INTR_DATA5_W                    	0x77
#define ASI_INTR_DATA5_W_VAL                	0x068
#define ASI_INTR_DISPATCH_W                 	0x77
#define ASI_INTR_DISPATCH_W_VAL             	0x070
#define ASI_INTR_DATA6_W                    	0x77
#define ASI_INTR_DATA6_W_VAL                	0x080
#define ASI_INTR_DATA7_W                    	0x77
#define ASI_INTR_DATA7_W_VAL                	0x088
#define ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE 	0x1e
#define ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE	0x1f
#define ASI_ECACHE_R                        	0x7e
#define ASI_EXT_R                           	0x7e
#define ASI_EXT_R_VAL                       	0x000
#define ASI_EC_R                            	0x7e
#define ASI_EC_R_VAL                        	0x000
#define ASI_ECACHE_DATA_R                   	0x7e
#define ASI_ECACHE_DATA_R_VAL               	0x000
#define ASI_INTR_R		              	0x7f
#define ASI_SIU_ERROR_READ_REG              	0x7f
#define ASI_INTR_DATA0_R                    	0x7f
#define ASI_INTR_DATA0_R_VAL                	0x040
#define ASI_INTR_DATA1_R                    	0x7f
#define ASI_INTR_DATA1_R_VAL                	0x048
#define ASI_INTR_DATA2_R                    	0x7f
#define ASI_INTR_DATA2_R_VAL                	0x050
#define ASI_INTR_DATA3_R                    	0x7f
#define ASI_INTR_DATA3_R_VAL                	0x058
#define ASI_INTR_DATA4_R                    	0x7f
#define ASI_INTR_DATA4_R_VAL                	0x060
#define ASI_INTR_DATA5_R                    	0x7f
#define ASI_INTR_DATA5_R_VAL                	0x068
#define ASI_INTR_DATA6_R                    	0x7f
#define ASI_INTR_DATA6_R_VAL                	0x080
#define ASI_INTR_DATA7_R                    	0x7f
#define ASI_INTR_DATA7_R_VAL                	0x088
#define ASI_PRIMARY                         	0x80
#define ASI_SECONDARY                       	0x81
#define ASI_PRIMARY_NO_FAULT                	0x82
#define ASI_SECONDARY_NO_FAULT              	0x83
#define ASI_PRIMARY_LITTLE                  	0x88
#define ASI_SECONDARY_LITTLE                	0x89
#define ASI_PRIMARY_NO_FAULT_LITTLE         	0x8a
#define ASI_SECONDARY_NO_FAULT_LITTLE       	0x8b
#define ASI_PST8_PRIMARY                    	0xc0
#define ASI_PST8_SECONDARY                  	0xc1
#define ASI_PST16_PRIMARY                   	0xc2
#define ASI_PST16_SECONDARY                 	0xc3
#define ASI_PST32_PRIMARY                   	0xc4
#define ASI_PST32_SECONDARY                 	0xc5
#define ASI_PST8_PRIMARY_LITTLE             	0xc8
#define ASI_PST8_SECONDARY_LITTLE           	0xc9
#define ASI_PST16_PRIMARY_LITTLE            	0xca
#define ASI_PST16_SECONDARY_LITTLE          	0xcb
#define ASI_PST32_PRIMARY_LITTLE            	0xcc
#define ASI_PST32_SECONDARY_LITTLE          	0xcd
#define ASI_FL8_PRIMARY                     	0xd0
#define ASI_FL8_SECONDARY                   	0xd1
#define ASI_FL16_PRIMARY                    	0xd2
#define ASI_FL16_SECONDARY                  	0xd3
#define ASI_FL8_PRIMARY_LITTLE              	0xd8
#define ASI_FL8_SECONDARY_LITTLE            	0xd9
#define ASI_FL16_PRIMARY_LITTLE             	0xda
#define ASI_FL16_SECONDARY_LITTLE           	0xdb
#define ASI_COMMIT_PRIMARY                  	0xe0
#define ASI_COMMIT_SECONDARY                	0xe1
#define ASI_BLK_INIT_ST_QUAD_LDD_P              0xe2
#define ASI_BLK_INIT_ST_QUAD_LDD_S              0xe3
#define ASI_BLK_INIT_ST_QUAD_LDD_P_LITTLE       0xea
#define ASI_BLK_INIT_ST_QUAD_LDD_S_LITTLE       0xeb
#define ASI_BLOCK_PRIMARY                   	0xf0
#define ASI_BLOCK_SECONDARY                 	0xf1
#define ASI_BLOCK_PRIMARY_LITTLE            	0xf8
#define ASI_BLOCK_SECONDARY_LITTLE          	0xf9

#define ASI_N                               	ASI_NUCLEUS                         
#define ASI_NL                              	ASI_NUCLEUS_LITTLE                  
#define ASI_AIUP                            	ASI_AS_IF_USER_PRIMARY              
#define ASI_AIUS                            	ASI_AS_IF_USER_SECONDARY            
#define ASI_AIUPL                           	ASI_AS_IF_USER_PRIMARY_LITTLE       
#define ASI_AIUSL                           	ASI_AS_IF_USER_SECONDARY_LITTLE     
#define ASI_PHYS_USE_EC_L                   	ASI_PHYS_USE_EC_LITTLE              
#define ASI_PHYS_BYPASS_EC_EBIT_L           	ASI_PHYS_BYPASS_EC_WITH_EBIT_LITTLE 
#define ASI_WC_DATA                         	ASI_WCACHE_DATA                     
#define ASI_WC_TAG                          	ASI_WCACHE_TAG                      
#define ASI_WC_SN_TAG                       	ASI_WCACHE_SNOOP_TAG                
#define ASI_DC_UT_TAG                       	ASI_DCACHE_UTAGS                    
#define ASI_DC_SN_TAG                       	ASI_DCACHE_SNOOP_TAG                
#define ASI_DC_DATA                         	ASI_DCACHE_DATA                     
#define ASI_DC_TAG                          	ASI_DCACHE_TAG                      
#define ASI_MONDO_SEND_CTRL                 	ASI_INTR_DISPATCH_STATUS            
#define ASI_MONDO_RECEIVE_CTRL              	ASI_INTR_RECEIVE                    
#define ASI_AFSR                            	ASI_ASYNC_FAULT_STATUS              
#define ASI_AFAR                            	ASI_ASYNC_FAULT_ADDR                
#define ASI_EC_TAG                          	ASI_ECACHE_TAG                      
#define ASI_FDIV_SQRT_SEED                  	ASI_FDIV_SEED                       
#define ASI_IC_INSTR                        	ASI_ICACHE_INSTR                    
#define ASI_IC_TAG                          	ASI_ICACHE_TAG                      
#define ASI_IC_SN_TAG                       	ASI_ICACHE_SNOOP_TAG                
#define ASI_BLK_AIUP                        	ASI_BLOCK_AS_IF_USER_PRIMARY        
#define ASI_BLK_AIUS                        	ASI_BLOCK_AS_IF_USER_SECONDARY      
#define ASI_ECACHE_CONTROL                  	ASI_ECACHE_CTRL                     
#define ASI_ECACHE_DATA_W                   	ASI_ECACHE_W                        
#define ASI_SIU_INTR_W                      	ASI_SIU_ERROR_WRITE_REG             
#define ASI_BLK_AIUPL                       	ASI_BLOCK_AS_IF_USER_PRIMARY_LITTLE 
#define ASI_BLK_AIUSL                       	ASI_BLOCK_AS_IF_USER_SECONDARY_LITTLE
#define ASI_SIU_INTR_R                      	ASI_SIU_ERROR_READ_REG              
#define ASI_P                               	ASI_PRIMARY                         
#define ASI_S                               	ASI_SECONDARY                       
#define ASI_PNF                             	ASI_PRIMARY_NO_FAULT                
#define ASI_SNF                             	ASI_SECONDARY_NO_FAULT              
#define ASI_PL                              	ASI_PRIMARY_LITTLE                  
#define ASI_SL                              	ASI_SECONDARY_LITTLE                
#define ASI_PNFL                            	ASI_PRIMARY_NO_FAULT_LITTLE         
#define ASI_SNFL                            	ASI_SECONDARY_NO_FAULT_LITTLE       
#define ASI_PST8_P                          	ASI_PST8_PRIMARY                    
#define ASI_PST8_S                          	ASI_PST8_SECONDARY                  
#define ASI_PST16_P                         	ASI_PST16_PRIMARY                   
#define ASI_PST16_S                         	ASI_PST16_SECONDARY                 
#define ASI_PST32_P                         	ASI_PST32_PRIMARY                   
#define ASI_PST32_S                         	ASI_PST32_SECONDARY                 
#define ASI_PST8_PL                         	ASI_PST8_PRIMARY_LITTLE             
#define ASI_PST8_SL                         	ASI_PST8_SECONDARY_LITTLE           
#define ASI_PST16_PL                        	ASI_PST16_PRIMARY_LITTLE            
#define ASI_PST16_SL                        	ASI_PST16_SECONDARY_LITTLE          
#define ASI_PST32_PL                        	ASI_PST32_PRIMARY_LITTLE            
#define ASI_PST32_SL                        	ASI_PST32_SECONDARY_LITTLE          
#define ASI_FL8_P                           	ASI_FL8_PRIMARY                     
#define ASI_FL8_S                           	ASI_FL8_SECONDARY                   
#define ASI_FL16_P                          	ASI_FL16_PRIMARY                    
#define ASI_FL16_S                          	ASI_FL16_SECONDARY                  
#define ASI_FL8_PL                          	ASI_FL8_PRIMARY_LITTLE              
#define ASI_FL8_SL                          	ASI_FL8_SECONDARY_LITTLE            
#define ASI_FL16_PL                         	ASI_FL16_PRIMARY_LITTLE             
#define ASI_FL16_SL                         	ASI_FL16_SECONDARY_LITTLE           
#define ASI_COMMIT_P                        	ASI_COMMIT_PRIMARY                  
#define ASI_COMMIT_S                        	ASI_COMMIT_SECONDARY                
#define ASI_BLK_COMMIT_P                        ASI_COMMIT_PRIMARY                  
#define ASI_BLK_COMMIT_S                        ASI_COMMIT_SECONDARY                
#define ASI_BLK_P                           	ASI_BLOCK_PRIMARY                   
#define ASI_BLK_S                           	ASI_BLOCK_SECONDARY                 
#define ASI_BLK_PL                          	ASI_BLOCK_PRIMARY_LITTLE            
#define ASI_BLK_SL                          	ASI_BLOCK_SECONDARY_LITTLE          

/* Macros from chplus	Ramana 03/10/2000 */
#define ASI_QUAD_LDD_PHYS                     0x34
#define ASI_QUAD_LDD_PHYS_LITTLE              0x3c
#define ASI_SRAM_FAST_INIT                    0x40
#define ASI_DMMU_TAG_ACCESS_EXT               0x58
#define ASI_DMMU_TAG_ACCESS_EXT_VAL           0x060
#define ASI_INTR_R                            0x7f
#define ASI_QUAD_LDD_PHYS_L                   ASI_QUAD_LDD_PHYS_LITTLE
#define ASI_SRAM_TEST_INIT                    ASI_SRAM_FAST_INIT
