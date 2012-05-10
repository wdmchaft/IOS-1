//
//  mobilesynthViewController.h
//  mobilesynth
//
//  Created by Allen Porter on 12/7/08.
//  Copyright thebends 2008. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioOutput.h"
#import "KeyboardView.h"
#import <AudioToolbox/AudioConverter.h>

namespace synth { class Controller; }
namespace synth { class Envelope; }
namespace synth { class LFO; }
namespace synth { class Oscillator; }
namespace synth { class Note; }
namespace synth { class LowPass; }

@class OscillatorView;
@class OscillatorDetailView;
@class ModulationView;
@class EnvelopeView;
@class FilterEnvelopeView;
@class FilterView;
@class ArpeggioView;
@class TouchForwardingUIScrollView;
@class Display_music;
@class Display_setting;


@interface mobilesynthViewController : UIViewController <KeyboardDelegate, SampleGenerator> {
 @private
  TouchForwardingUIScrollView* keyboardScrollView;
  KeyboardView* keyboardView;
  UIScrollView* controlScrollView;
  UIPageControl* controlPageControl;
  UIPageControl* menuPageControl;

        
  OscillatorView* oscillatorView;
  OscillatorDetailView* oscillatorDetailView;
  ModulationView* modulationView;
  FilterView* filterView;
  EnvelopeView* envelopeView;
  EnvelopeView* filterEnvelopeView;
  ArpeggioView* arpeggioView;
  UIScrollView *menuScrollView;
  Display_setting * first;  
  Display_music *second;

  // Synthesizer components
  AudioOutput* output;
  synth::Controller* controller_;
  
  AudioStreamBasicDescription outputFormat;
}

@property (nonatomic, retain) IBOutlet UIScrollView *keyboardScrollView;
@property (nonatomic, retain) IBOutlet UIScrollView *menuScrollView;

@property (nonatomic, retain) IBOutlet UIScrollView *controlScrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *controlPageControl;
@property (nonatomic, retain) IBOutlet UIPageControl *menuPageControl;

@property (nonatomic, retain) IBOutlet OscillatorView *oscillatorView;
@property (nonatomic, retain) IBOutlet OscillatorDetailView *oscillatorDetailView;
@property (nonatomic, retain) IBOutlet ModulationView *modulationView;
@property (nonatomic, retain) IBOutlet FilterView *filterView;
@property (nonatomic, retain) IBOutlet EnvelopeView *envelopeView;
@property (nonatomic, retain) IBOutlet EnvelopeView *filterEnvelopeView;
@property (nonatomic, retain) IBOutlet ArpeggioView *arpeggioView;
@property (nonatomic, retain) IBOutlet Display_setting *first;
@property (nonatomic, retain) IBOutlet Display_music *second;


- (void)noteOn:(int)note;
- (void)noteOff:(int)note;
- (OSStatus)generateSamples:(AudioBufferList*)buffers;

// For control panel
- (IBAction)changePage:(id)sender;
- (IBAction)changeMenu:(id)sender;


@end

