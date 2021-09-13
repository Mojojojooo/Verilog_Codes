`define TRUE 1'b1
`define FALSE 1'b0
`define RED 2'd0
`define YELLOW 2'd1
`define GREEN 2'd2

//States
`define S0 3'd0
`define S1 3'd1
`define S2 3'd2
`define S3 3'd3
`define S4 3'd4 

//Delays
`define Y2RDelay 3
`define R2GDelay 2

module signalControl(
    hwy,contry,flag,clock,clear
);

output [1:0] hwy,contry;
reg [1:0] hwy,contry;

input flag;

input clear,clock;

reg [2:0] state;
reg [2:0] nxt_state;

initial begin
    state = `S0;
    nxt_state = `S0;
    hwy = `GREEN;
    contry = `RED;
end

always @(posedge clock) begin
    state = nxt_state;
end

always @(state) begin
    case(state)
    `S0:begin
      hwy = `GREEN;
      contry = `RED;
    end
    `S1:begin
      hwy = `YELLOW;
      contry = `RED;
    end
    `S2:begin
      hwy = `RED;
      contry = `RED;
    end
    `S3:begin
      hwy = `RED;
      contry = `GREEN;
    end
    `S4:begin
      hwy = `RED;
      contry = `YELLOW;
    end    
    endcase
end

always @(state or clear or flag) begin
    if(clear)
        nxt_state = `S0;
    else 
        case(state)
        `S0: begin
                if(flag)
                    nxt_state = `S1;
                else 
                    nxt_state = `S0;
             end
        `S1: begin
                repeat (`Y2RDelay) @(posedge clock)
                    nxt_state = `S2;
             end
        `S2: begin
                repeat (`R2GDelay) @(posedge clock)
                    nxt_state = `S3;
             end
        `S3: begin
                if(flag)
                    nxt_state = `S3;
                else 
                    nxt_state = `S4;
             end
        `S4: begin
                repeat (`Y2RDelay) @(posedge clock)
                    nxt_state = `S0;
            end
        default: nxt_state = `S0;
        endcase
end
endmodule