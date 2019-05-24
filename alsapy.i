/* 
	http://www.swig.org/Doc4.0/SWIGDocumentation.html
	https://www.alsa-project.org/alsa-doc/alsa-lib/index.html
	http://www.swig.org/tutorial.html
	https://www.linuxjournal.com/article/6735
	https://github.com/swig
*/
%module alsapy
// This input typemap declares that char** requires no input parameter.
// Instead, the address of a local char* is used to call the function.
%typemap(in,numinputs=0) char** (char* tmp) %{
    $1 = &tmp;
%}

// After the function is called, the char** parameter contains a malloc'ed char* pointer.
// Construct a Python Unicode object (I'm using Python 3) and append it to
// any existing return value for the wrapper.
%typemap(argout) char** (PyObject* obj) %{
    obj = PyUnicode_FromString(*$1);
    $result = SWIG_Python_AppendOutput($result,obj);
%}

// The malloc'ed pointer is no longer needed, so make sure it is freed.
%typemap(freearg) char** %{
    free(*$1);
%}
%{
#include "/usr/include/alsa/asoundlib.h"
/* enum snd_pcm_start_t */
const int SND_PCM_STREAM_PLAYBACK_ = SND_PCM_STREAM_PLAYBACK;
const int SND_PCM_STREAM_CAPTURE_ = SND_PCM_STREAM_CAPTURE;
/* enum snd_pcm_format_t */
const int  SND_PCM_FORMAT_UNKNOWN_ = SND_PCM_FORMAT_UNKNOWN;
const int  SND_PCM_FORMAT_S8_ = SND_PCM_FORMAT_S8;
const int  SND_PCM_FORMAT_U8_ = SND_PCM_FORMAT_U8;
const int  SND_PCM_FORMAT_S16_LE_ = SND_PCM_FORMAT_S16_LE;
const int  SND_PCM_FORMAT_S16_BE_ = SND_PCM_FORMAT_S16_BE;
const int  SND_PCM_FORMAT_U16_LE_ = SND_PCM_FORMAT_U16_LE;
const int  SND_PCM_FORMAT_U16_BE_ = SND_PCM_FORMAT_U16_BE;
const int  SND_PCM_FORMAT_S24_LE_ = SND_PCM_FORMAT_S24_LE;
const int  SND_PCM_FORMAT_S24_BE_ = SND_PCM_FORMAT_S24_BE;
const int  SND_PCM_FORMAT_U24_LE_ = SND_PCM_FORMAT_U24_LE;
const int  SND_PCM_FORMAT_U24_BE_ = SND_PCM_FORMAT_U24_BE;
const int  SND_PCM_FORMAT_S32_LE_ = SND_PCM_FORMAT_S32_LE;
const int  SND_PCM_FORMAT_S32_BE_ = SND_PCM_FORMAT_S32_BE;
const int  SND_PCM_FORMAT_U32_LE_ = SND_PCM_FORMAT_U32_LE;
const int  SND_PCM_FORMAT_U32_BE_ = SND_PCM_FORMAT_U32_BE;
const int  SND_PCM_FORMAT_FLOAT_LE_ = SND_PCM_FORMAT_FLOAT_LE;
const int  SND_PCM_FORMAT_FLOAT_BE_ = SND_PCM_FORMAT_FLOAT_BE;
const int  SND_PCM_FORMAT_FLOAT64_LE_ = SND_PCM_FORMAT_FLOAT64_LE;
const int  SND_PCM_FORMAT_FLOAT64_BE_ = SND_PCM_FORMAT_FLOAT64_BE;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_LE_ = SND_PCM_FORMAT_IEC958_SUBFRAME_LE;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_BE_ = SND_PCM_FORMAT_IEC958_SUBFRAME_BE;
const int  SND_PCM_FORMAT_MU_LAW_ = SND_PCM_FORMAT_MU_LAW;
const int  SND_PCM_FORMAT_A_LAW_ = SND_PCM_FORMAT_A_LAW;
const int  SND_PCM_FORMAT_IMA_ADPCM_ = SND_PCM_FORMAT_IMA_ADPCM;
const int  SND_PCM_FORMAT_MPEG_ = SND_PCM_FORMAT_MPEG;
const int  SND_PCM_FORMAT_GSM_ = SND_PCM_FORMAT_GSM;
const int  SND_PCM_FORMAT_SPECIAL_ = SND_PCM_FORMAT_SPECIAL;
const int  SND_PCM_FORMAT_S24_3LE_ = SND_PCM_FORMAT_S24_3LE;
const int  SND_PCM_FORMAT_S24_3BE_ = SND_PCM_FORMAT_S24_3BE;
const int  SND_PCM_FORMAT_U24_3LE_ = SND_PCM_FORMAT_U24_3LE;
const int  SND_PCM_FORMAT_U24_3BE_ = SND_PCM_FORMAT_U24_3BE;
const int  SND_PCM_FORMAT_S20_3LE_ = SND_PCM_FORMAT_S20_3LE;
const int  SND_PCM_FORMAT_S20_3BE_ = SND_PCM_FORMAT_S20_3BE;
const int  SND_PCM_FORMAT_U20_3LE_ = SND_PCM_FORMAT_U20_3LE;
const int  SND_PCM_FORMAT_U20_3BE_ = SND_PCM_FORMAT_U20_3BE;
const int  SND_PCM_FORMAT_S18_3LE_ = SND_PCM_FORMAT_S18_3LE;
const int  SND_PCM_FORMAT_S18_3BE_ = SND_PCM_FORMAT_S18_3BE;
const int  SND_PCM_FORMAT_U18_3LE_ = SND_PCM_FORMAT_U18_3LE;
const int  SND_PCM_FORMAT_U18_3BE_ = SND_PCM_FORMAT_U18_3BE;
const int  SND_PCM_FORMAT_S16_ = SND_PCM_FORMAT_S16;
const int  SND_PCM_FORMAT_U16_ = SND_PCM_FORMAT_U16;
const int  SND_PCM_FORMAT_S24_ = SND_PCM_FORMAT_S24;
const int  SND_PCM_FORMAT_U24_ = SND_PCM_FORMAT_U24;
const int  SND_PCM_FORMAT_S32_ = SND_PCM_FORMAT_S32;
const int  SND_PCM_FORMAT_U32_ = SND_PCM_FORMAT_U32;
const int  SND_PCM_FORMAT_FLOAT_ = SND_PCM_FORMAT_FLOAT;
const int  SND_PCM_FORMAT_FLOAT64_ = SND_PCM_FORMAT_FLOAT64;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_ = SND_PCM_FORMAT_IEC958_SUBFRAME;
/* enum snd_pcm_subformat_t */
const int SND_PCM_SUBFORMAT_STD_ = SND_PCM_SUBFORMAT_STD;
/* enum snd_pcm_state_t  */
const int SND_PCM_STATE_OPEN_=SND_PCM_STATE_OPEN;
const int SND_PCM_STATE_SETUP_=SND_PCM_STATE_SETUP;
const int SND_PCM_STATE_PREPARED_=SND_PCM_STATE_PREPARED;
const int SND_PCM_STATE_RUNNING_=SND_PCM_STATE_RUNNING;
const int SND_PCM_STATE_XRUN_=SND_PCM_STATE_XRUN;
const int SND_PCM_STATE_DRAINING_=SND_PCM_STATE_DRAINING;
const int SND_PCM_STATE_PAUSED_=SND_PCM_STATE_PAUSED;
const int SND_PCM_STATE_SUSPENDED_=SND_PCM_STATE_SUSPENDED;
const int SND_PCM_STATE_DISCONNECTED_=SND_PCM_STATE_DISCONNECTED;
%}
/* enum snd_pcm_start_t */
const int SND_PCM_STREAM_PLAYBACK_ = SND_PCM_STREAM_PLAYBACK;
const int SND_PCM_STREAM_CAPTURE_ = SND_PCM_STREAM_CAPTURE;
/* enum snd_pcm_format_t */
const int  SND_PCM_FORMAT_UNKNOWN_ = SND_PCM_FORMAT_UNKNOWN;
const int  SND_PCM_FORMAT_S8_ = SND_PCM_FORMAT_S8;
const int  SND_PCM_FORMAT_U8_ = SND_PCM_FORMAT_U8;
const int  SND_PCM_FORMAT_S16_LE_ = SND_PCM_FORMAT_S16_LE;
const int  SND_PCM_FORMAT_S16_BE_ = SND_PCM_FORMAT_S16_BE;
const int  SND_PCM_FORMAT_U16_LE_ = SND_PCM_FORMAT_U16_LE;
const int  SND_PCM_FORMAT_U16_BE_ = SND_PCM_FORMAT_U16_BE;
const int  SND_PCM_FORMAT_S24_LE_ = SND_PCM_FORMAT_S24_LE;
const int  SND_PCM_FORMAT_S24_BE_ = SND_PCM_FORMAT_S24_BE;
const int  SND_PCM_FORMAT_U24_LE_ = SND_PCM_FORMAT_U24_LE;
const int  SND_PCM_FORMAT_U24_BE_ = SND_PCM_FORMAT_U24_BE;
const int  SND_PCM_FORMAT_S32_LE_ = SND_PCM_FORMAT_S32_LE;
const int  SND_PCM_FORMAT_S32_BE_ = SND_PCM_FORMAT_S32_BE;
const int  SND_PCM_FORMAT_U32_LE_ = SND_PCM_FORMAT_U32_LE;
const int  SND_PCM_FORMAT_U32_BE_ = SND_PCM_FORMAT_U32_BE;
const int  SND_PCM_FORMAT_FLOAT_LE_ = SND_PCM_FORMAT_FLOAT_LE;
const int  SND_PCM_FORMAT_FLOAT_BE_ = SND_PCM_FORMAT_FLOAT_BE;
const int  SND_PCM_FORMAT_FLOAT64_LE_ = SND_PCM_FORMAT_FLOAT64_LE;
const int  SND_PCM_FORMAT_FLOAT64_BE_ = SND_PCM_FORMAT_FLOAT64_BE;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_LE_ = SND_PCM_FORMAT_IEC958_SUBFRAME_LE;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_BE_ = SND_PCM_FORMAT_IEC958_SUBFRAME_BE;
const int  SND_PCM_FORMAT_MU_LAW_ = SND_PCM_FORMAT_MU_LAW;
const int  SND_PCM_FORMAT_A_LAW_ = SND_PCM_FORMAT_A_LAW;
const int  SND_PCM_FORMAT_IMA_ADPCM_ = SND_PCM_FORMAT_IMA_ADPCM;
const int  SND_PCM_FORMAT_MPEG_ = SND_PCM_FORMAT_MPEG;
const int  SND_PCM_FORMAT_GSM_ = SND_PCM_FORMAT_GSM;
const int  SND_PCM_FORMAT_SPECIAL_ = SND_PCM_FORMAT_SPECIAL;
const int  SND_PCM_FORMAT_S24_3LE_ = SND_PCM_FORMAT_S24_3LE;
const int  SND_PCM_FORMAT_S24_3BE_ = SND_PCM_FORMAT_S24_3BE;
const int  SND_PCM_FORMAT_U24_3LE_ = SND_PCM_FORMAT_U24_3LE;
const int  SND_PCM_FORMAT_U24_3BE_ = SND_PCM_FORMAT_U24_3BE;
const int  SND_PCM_FORMAT_S20_3LE_ = SND_PCM_FORMAT_S20_3LE;
const int  SND_PCM_FORMAT_S20_3BE_ = SND_PCM_FORMAT_S20_3BE;
const int  SND_PCM_FORMAT_U20_3LE_ = SND_PCM_FORMAT_U20_3LE;
const int  SND_PCM_FORMAT_U20_3BE_ = SND_PCM_FORMAT_U20_3BE;
const int  SND_PCM_FORMAT_S18_3LE_ = SND_PCM_FORMAT_S18_3LE;
const int  SND_PCM_FORMAT_S18_3BE_ = SND_PCM_FORMAT_S18_3BE;
const int  SND_PCM_FORMAT_U18_3LE_ = SND_PCM_FORMAT_U18_3LE;
const int  SND_PCM_FORMAT_U18_3BE_ = SND_PCM_FORMAT_U18_3BE;
const int  SND_PCM_FORMAT_S16_ = SND_PCM_FORMAT_S16;
const int  SND_PCM_FORMAT_U16_ = SND_PCM_FORMAT_U16;
const int  SND_PCM_FORMAT_S24_ = SND_PCM_FORMAT_S24;
const int  SND_PCM_FORMAT_U24_ = SND_PCM_FORMAT_U24;
const int  SND_PCM_FORMAT_S32_ = SND_PCM_FORMAT_S32;
const int  SND_PCM_FORMAT_U32_ = SND_PCM_FORMAT_U32;
const int  SND_PCM_FORMAT_FLOAT_ = SND_PCM_FORMAT_FLOAT;
const int  SND_PCM_FORMAT_FLOAT64_ = SND_PCM_FORMAT_FLOAT64;
const int  SND_PCM_FORMAT_IEC958_SUBFRAME_ = SND_PCM_FORMAT_IEC958_SUBFRAME;
/* enum snd_pcm_subformat_t */
const int SND_PCM_SUBFORMAT_STD_ = SND_PCM_SUBFORMAT_STD;
/* enum snd_pcm_state_t  */
const int SND_PCM_STATE_OPEN_=SND_PCM_STATE_OPEN;
const int SND_PCM_STATE_SETUP_=SND_PCM_STATE_SETUP;
const int SND_PCM_STATE_PREPARED_=SND_PCM_STATE_PREPARED;
const int SND_PCM_STATE_RUNNING_=SND_PCM_STATE_RUNNING;
const int SND_PCM_STATE_XRUN_=SND_PCM_STATE_XRUN;
const int SND_PCM_STATE_DRAINING_=SND_PCM_STATE_DRAINING;
const int SND_PCM_STATE_PAUSED_=SND_PCM_STATE_PAUSED;
const int SND_PCM_STATE_SUSPENDED_=SND_PCM_STATE_SUSPENDED;
const int SND_PCM_STATE_DISCONNECTED_=SND_PCM_STATE_DISCONNECTED;
extern const char * snd_asoundlib_version (void);
extern const char* snd_pcm_stream_name(snd_pcm_stream_t stream);
extern int snd_pcm_open (snd_pcm_t **pcm, const char *name, snd_pcm_stream_t stream, int mode);
extern const char* snd_pcm_access_name(snd_pcm_access_t acc);
extern const char* snd_pcm_format_name  (snd_pcm_format_t format);
extern const char* snd_pcm_subformat_name(snd_pcm_subformat_t subformat);
extern const char* snd_pcm_state_name(snd_pcm_state_t state);
extern int snd_card_next(int *INOUT);
extern int snd_config_update_free_global(void);
extern int snd_card_get_name(int card,char **name);
