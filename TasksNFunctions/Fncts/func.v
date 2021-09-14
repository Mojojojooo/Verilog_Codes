module func(
    max,a,b
);

parameter delay =10;
input a,b;
output max;
reg max;

always @(a or b) begin
    max = maxValue(a,b);
end

function maxValue;
    // output max;
    input A,B;
    begin
        maxValue = (A > B)? A : B;
    end
endfunction

    
// task max;
//     output max;
//     input A,B;
//     begin
//         max = (A > B)? A : B;
//     end
// endtask

endmodule