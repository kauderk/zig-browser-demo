const Builder = @import("std").build.Builder;

pub fn build(b: *Builder) void {
    const mode = b.standardReleaseOptions();

    const exe = b.addExecutable("math", "math.zig");
    exe.setBuildMode(mode);

    const target = b.standardTargetOptions(.{});
    target.target = "wasm32-freestanding";
    target.dynamic = true;
    target.rdynamic = true;

    exe.setTarget(target);

    // Include any other configuration or options you need here.

    exe.install();

    // Build a simple HTTP server using Python for serving the files
    const server = b.addCommand();
    server.name = "python";
    server.args.append("-m");
    server.args.append("http.server");
    server.install();

    b.default_step.dependOn(&exe.step);
    b.installArtifact(exe);

    // You might want to set up additional steps or configurations based on your needs.
}
