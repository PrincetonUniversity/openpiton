
    // This file is autogenrated using sims,2  and contains the memory controller mapping information
    #ifndef MC_TILE_CONNECT_H
    #define  MC_TILE_CONNECT_H

        #define PRONOC_T1  1
        #define PRONOC_T2  1
        #define PRONOC_T3  1
        
        #define PITON_PORT_L  0
        #define PITON_PORT_E  1
        #define PITON_PORT_N  2
        #define PITON_PORT_W  3
        #define PITON_PORT_S  4
    
        typedef struct {
               unsigned int x;
               unsigned int y;
               unsigned int p;
               unsigned int id;
               unsigned int endp;
        } mc_map_t;    
   
    #define  MCS_NUM  0

    mc_map_t mc_map[1]={ 
{ 0,0,0,0,0}};
 #endif 
