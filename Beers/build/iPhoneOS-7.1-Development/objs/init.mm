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
void MREP_8BE2BB9338174E73924B33BD3602D4E0(void *, void *);
void MREP_7DF95F7C569940FF8DF8C87BA890187A(void *, void *);
void MREP_BFC729BA81CD471EBEF39071568B70E1(void *, void *);
void MREP_3616D10B29A04C5F9014B12DB3801BBD(void *, void *);
void MREP_16D28F1BA5254EACBB16D34BF4983733(void *, void *);
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
MREP_8BE2BB9338174E73924B33BD3602D4E0(self, 0);
MREP_7DF95F7C569940FF8DF8C87BA890187A(self, 0);
MREP_BFC729BA81CD471EBEF39071568B70E1(self, 0);
MREP_3616D10B29A04C5F9014B12DB3801BBD(self, 0);
MREP_16D28F1BA5254EACBB16D34BF4983733(self, 0);
#if !__LP64__
	}
	catch (...) {
	    rb_rb2oc_exc_handler();
	}
#endif
	initialized = true;
    }
}
