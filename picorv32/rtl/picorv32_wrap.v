/*
 * Generated by harness_gen.py
 * From: picorv32_def.v
 */
module top(input wire clk, input wire stb, input wire di, output wire do);
    localparam integer DIN_N = 101;
    localparam integer DOUT_N = 307;

    reg [DIN_N-1:0] din;
    wire [DOUT_N-1:0] dout;

    reg [DIN_N-1:0] din_shr;
    reg [DOUT_N-1:0] dout_shr;

    always @(posedge clk) begin
        din_shr <= {din_shr, di};
        dout_shr <= {dout_shr, din_shr[DIN_N-1]};
        if (stb) begin
            din <= din_shr;
            dout_shr <= dout;
        end
    end

    assign do = dout_shr[DOUT_N-1];
    picorv32 dut(
            .clk(clk),
            .resetn(din[0]),
            .trap(dout[0]),
            .mem_valid(dout[1]),
            .mem_instr(dout[2]),
            .mem_ready(din[1]),
            .mem_addr(dout[34:3]),
            .mem_wdata(dout[66:35]),
            .mem_wstrb(dout[70:67]),
            .mem_rdata(din[33:2]),
            .mem_la_read(dout[71]),
            .mem_la_write(dout[72]),
            .mem_la_addr(dout[104:73]),
            .mem_la_wdata(dout[136:105]),
            .mem_la_wstrb(dout[140:137]),
            .pcpi_valid(dout[141]),
            .pcpi_insn(dout[173:142]),
            .pcpi_rs1(dout[205:174]),
            .pcpi_rs2(dout[237:206]),
            .pcpi_wr(din[34]),
            .pcpi_rd(din[66:35]),
            .pcpi_wait(din[67]),
            .pcpi_ready(din[68]),
            .irq(din[100:69]),
            .eoi(dout[269:238]),
            .trace_valid(dout[270]),
            .trace_data(dout[306:271])
            );
endmodule
