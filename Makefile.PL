use lib qw(inc);
use Devel::CheckLib;
use Cwd;
use Config;

check_lib_or_exit(
    debug   => 1,
    lib     => 'exif',
    libpath => [ grep length, split /\s+/,$Config::Config{libsdirs} ],
    incpath => [ Cwd::cwd(), grep length, split /\s+/,$Config::Config{locincpth} ],
    header  => [['<libexif/exif-loader.h>']],
    #define0 => "#define JPEG_INTERNALS\n",
    #define  => "#if JPEG_LIB_VERSION < 80\n#error jpeglib version >= 80 required\n#endif",
);

use 5.006002;
use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
	NAME              => 'Image::LibExif',
	VERSION_FROM      => 'lib/Image/LibExif.pm', # finds $VERSION
	PREREQ_PM         => {}, # e.g., Module::Name => 1.1
	ABSTRACT_FROM     => 'lib/Image/LibExif.pm', # retrieve abstract from module
	AUTHOR            => 'Mons Anderson <mons@cpan.org>',
	LIBS              => ['-lexif'], # e.g., '-lm'
	DEFINE            => '', # e.g., '-DHAVE_SOMETHING'
	INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	#CCFLAGS           => '-std=gnu99',
	#CCFLAGS           => '-Wunused -std=c99',
	#OBJECT            => 'JpegTran.o transupp.o', # link all the C files too
);
