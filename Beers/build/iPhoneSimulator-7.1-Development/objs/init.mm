#import <Foundation/Foundation.h>

extern "C" {
    void ruby_sysinit(int *, char ***);
    void ruby_init(void);
    void ruby_init_loadpath(void);
    void ruby_script(const char *);
    void ruby_set_argv(int, char **);
    void rb_vm_init_compiler(void);
    void rb_vm_init_jit(void);
    void rb_vm_aot_feature_provide(const char *, void *);
    void *rb_vm_top_self(void);
    void rb_define_global_const(const char *, void *);
    void rb_rb2oc_exc_handler(void);
    void rb_exit(int);
void MREP_BAEDA518694C49FDB5520A0D078C532E(void *, void *);
void MREP_70222248FDF443CF8C34F0C2E7F7B780(void *, void *);
void MREP_2508C6C8A1D741D486D08DC03AFFC611(void *, void *);
void MREP_9204B095DB1945E894CC4641422E460B(void *, void *);
void MREP_1DA81D7D1DD14DF8A852C39EA56A3177(void *, void *);
}

extern "C"
void
RubyMotionInit(int argc, char **argv)
{
    static bool initialized = false;
    if (!initialized) {
	ruby_init();
	ruby_init_loadpath();
        if (argc > 0) {
	    const char *progname = argv[0];
	    ruby_script(progname);
	}
#if !__LP64__
	try {
#endif
	    void *self = rb_vm_top_self();
rb_define_global_const("RUBYMOTION_ENV", @"development");
rb_define_global_const("RUBYMOTION_VERSION", @"3.13");
MREP_BAEDA518694C49FDB5520A0D078C532E(self, 0);
MREP_70222248FDF443CF8C34F0C2E7F7B780(self, 0);
MREP_2508C6C8A1D741D486D08DC03AFFC611(self, 0);
MREP_9204B095DB1945E894CC4641422E460B(self, 0);
MREP_1DA81D7D1DD14DF8A852C39EA56A3177(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
