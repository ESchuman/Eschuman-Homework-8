env = Environment();
ma = env.Program(target='ma', source=['ma.c', 'libcma.so'])
testy = env.Program(target='testy', source=['testy.c', 'libcma.so'])
env.Alias('install', ['/usr/local/bin'])
env.Alias('clean', env.Command('clean.dummy', [], 'scons -c'))

lib_target = "libcma.so"
lib_sources = ["cma.c"]

env.SharedLibrary(target = lib_target, source = lib_sources)

all = ma, testy

env.Install("/usr/local/bin", ma)
env.Install("/usr/local/bin", testy)


Default(all)
