# Copyright (c) 2016 Princeton University
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of Princeton University nor the
#       names of its contributors may be used to endorse or promote products
#       derived from this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY PRINCETON UNIVERSITY "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL PRINCETON UNIVERSITY BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

# Power mesh templates
template: sram(width,x_step,x_pitch,offset) {
    layer: M5 {
        direction: vertical
        width: @width
        spacing: @x_pitch
        number:
        pitch: @x_step
        offset_start: boundary
        offset_type: centerline
        offset: @offset
        trim_strap: off
    }
    advanced_rule: on {
        stack_vias: adjacent
    }
}

template: macro_m4(width,y_step,y_pitch,offset_y) {
    layer: M4 {
        direction: horizontal
        width: @width
        spacing: @y_pitch
        number:
        pitch: @y_step
        offset_start: boundary
        offset_type: centerline
        offset: @offset_y
        trim_strap: true  
    }
    advanced_rule: on {
        stack_vias: adjacent
    }
}

template: macro_m5(width,x_step,x_pitch,offset_x) {
    layer: M5 {
        direction: vertical
        width: @width
        spacing: @x_pitch
        number:
        pitch: @x_step
        offset_start: boundary
        offset_type: centerline
        offset: @offset_x
        trim_strap: true
    }
    advanced_rule: on {
        stack_vias: adjacent
    }
}

template: default_low(width,step,pitch) {
    layer: M3 {
        direction: vertical
        width: @width
        spacing: @pitch
        number:
        pitch: @step
        offset_start: boundary
        offset_type: centerline
        offset: @step
        trim_strap: false
    }
    advanced_rule: on {
        align_strap_with_stdcell_rail: off
        stack_vias: adjacent
    }
}

template: default(width_mid,width_high,x_step_mid,x_step_high,x_pitch_mid,x_pitch_high,y_step_mid,y_step_high,y_pitch_mid,y_pitch_high) {
    layer: M6 {
        direction: horizontal
        width: @width_mid
        spacing: @y_pitch_mid
        number:
        pitch: @y_step_mid
        offset_start: boundary
        offset_type: centerline
        offset: @y_step_mid
        trim_strap: false  
    }
    layer: M7 {
        direction: vertical
        width: @width_mid
        spacing: @x_pitch_mid
        number:
        pitch: @x_step_mid
        offset_start: boundary
        offset_type: centerline
        offset: @x_step_mid
        trim_strap: false
    }
    layer: M10 {
        direction: horizontal
        width: @width_high
        spacing: @y_pitch_high
        number:
        pitch: @y_step_high
        offset_start: boundary
        offset_type: centerline
        offset: @y_step_high
        trim_strap: false  
    }
    layer: M11 {
        direction: vertical
        width: @width_high
        spacing: @x_pitch_high
        number:
        pitch: @x_step_high
        offset_start: boundary
        offset_type: centerline
        offset: @x_step_high
        trim_strap: false
    }
    advanced_rule: on {
        stack_vias: specified {
            connect_layers: {M3 M6}
            connect_layers: {M5 M6}
            connect_layers: {M6 M7}
            connect_layers: {M7 M10}
            connect_layers: {M10 M11}
        }
    }
}

template: default_low_offset(width,step,pitch,offset) {
    layer: M3 {
        direction: vertical
        width: @width
        spacing: @pitch
        number:
        pitch: @step
        offset_start: boundary
        offset_type: centerline
        offset: @offset
        trim_strap: false
    }
    advanced_rule: on {
        align_strap_with_stdcell_rail: off
        stack_vias: adjacent
    }
}

template: default_offset(width_mid,width_high,x_step_mid,x_step_high,x_pitch_mid,x_pitch_high,y_step_mid,y_step_high,y_pitch_mid,y_pitch_high,x_offset,y_offset) {
    layer: M6 {
        direction: horizontal
        width: @width_mid
        spacing: @y_pitch_mid
        number:
        pitch: @y_step_mid
        offset_start: boundary
        offset_type: centerline
        offset: @y_offset
        trim_strap: false  
    }
    layer: M7 {
        direction: vertical
        width: @width_mid
        spacing: @x_pitch_mid
        number:
        pitch: @x_step_mid
        offset_start: boundary
        offset_type: centerline
        offset: @x_offset
        trim_strap: false
    }
    layer: M10 {
        direction: horizontal
        width: @width_high
        spacing: @y_pitch_high
        number:
        pitch: @y_step_high
        offset_start: boundary
        offset_type: centerline
        offset: @y_offset
        trim_strap: false  
    }
    layer: M11 {
        direction: vertical
        width: @width_high
        spacing: @x_pitch_high
        number:
        pitch: @x_step_high
        offset_start: boundary
        offset_type: centerline
        offset: @x_offset
        trim_strap: false
    }
    advanced_rule: on {
        stack_vias: specified {
            connect_layers: {M3 M6}
            connect_layers: {M5 M6}
            connect_layers: {M6 M7}
            connect_layers: {M7 M10}
            connect_layers: {M10 M11}
        }
    }
}
