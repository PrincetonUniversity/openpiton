`include "bsg_defines.sv"

// MBT popcount
//
// 10-24-14
//

//module bsg_popcount #(parameter `BSG_INV_PARAM(width_p))
module bsg_popcount #(parameter width_p=1)
   (input [width_p-1:0] i
    , output [$clog2(width_p+1)-1:0] o
    );

   // perf fixme: better to round up to nearest power of two and then
   // recurse with side full and one side minimal
   //
   // e.g-> 80 -> 128/2 = 64 --> (64,16)
   //
   // possibly slightly better is to use 2^N-1:
   // 
   // for items that are 5..7 bits wide, we make sure to
   // split into a 4 and a 1/2/3; since the four is relatively optimized.
   //

   localparam first_half_lp  = `BSG_MAX(4,width_p - (width_p >> 1));
   localparam second_half_lp = width_p - first_half_lp;

   if (width_p <= 3)
     begin : lt3
        assign o[0] = ^i;

        if (width_p == 2)
          assign o[1] = & i;
        else
          if (width_p == 3)
            assign o[1] = (&i[1:0]) | (&i[2:1]) | (i[0]&i[2]);
     end
   else
     // http://www.wseas.us/e-library/conferences/2006hangzhou/papers/531-262.pdf

     if (width_p == 4)
       begin : four
          // half adders
          wire [1:0] s0 = { ^i[3:2], ^i[1:0]};
          wire [1:0] c0 = { &i[3:2], &i[1:0]};

          // low bit is xor of all bits
          assign o[0] =  ^s0;

          // middle bit is: ab ^ cd
          //            or  (a^b) & (c^d)

          assign o[1] =  (^c0) | (&s0);

          // high bit is and of all bits

          assign o[2] =  &c0;
       end
     else
       begin : recurse
          wire [$clog2(first_half_lp+1)-1:0]  lo;
          wire [$clog2(second_half_lp+1)-1:0] hi;

          bsg_popcount #(.width_p(first_half_lp))
             left(.i(i[0+:first_half_lp])
                  ,.o(lo)
                  );

          bsg_popcount #(.width_p(second_half_lp))
          right(.i(i[first_half_lp+:second_half_lp])
                ,.o(hi)
                );

          assign o = lo+hi;
       end

endmodule // bsg_popcount

`BSG_ABSTRACT_MODULE(bsg_popcount)
