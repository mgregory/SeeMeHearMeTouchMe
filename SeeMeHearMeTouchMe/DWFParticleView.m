//
//  DWFParticleView.m
//  DrawWithFire
//
//  Created by Ray Wenderlich on 10/6/11.
//  Copyright 2011 Razeware LLC. All rights reserved.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "DWFParticleView.h"
#import <QuartzCore/QuartzCore.h>

@implementation DWFParticleView
{
    CAEmitterLayer* fireEmitter; //1
}

-(void)awakeFromNib
{
    //set ref to the layer
    fireEmitter = (CAEmitterLayer*)self.layer; //2
    //configure the emitter layer
    fireEmitter.emitterPosition = CGPointMake(50, 50);
    fireEmitter.emitterSize = CGSizeMake(10, 10);
    
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 0;
    fire.lifetime = 3.0;
    fire.lifetimeRange = 0.5;
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:1] CGColor];
	//fire.color = [[[UIColor greenColor] colorWithAlphaComponent:0.1] CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"paw1.png"] CGImage];
    [fire setName:@"fire"];

    fire.velocity = 10;
    fire.velocityRange = 20;

	fire.emissionLatitude = M_PI_2;
	fire.emissionLongitude = 0;//M_PI_2;
	fire.emissionRange = M_2_PI;
	fire.emissionRange = 0;
    
    fire.scaleSpeed = 0.3;
    fire.spin = 0.5;
	fire.spinRange = 0.5;
    
    
///////////////////
	CAEmitterCell* fire2 = [CAEmitterCell emitterCell];
    fire2.birthRate = 200;
    fire2.lifetime = 1.0;
    fire2.lifetimeRange = 0.5;
    fire2.color = [[UIColor colorWithRed:0.3 green:0.84 blue:0.2 alpha:0.8] CGColor];
	fire2.contents = (id)[[UIImage imageNamed:@"sub_particle1.png"] CGImage];
    [fire2 setName:@"fire2"];
	
    fire2.velocity = 100;
    fire2.velocityRange = 20;
	
	fire2.emissionLatitude = M_PI;
	fire2.emissionLongitude = 0;//M_PI_2;
    fire2.emissionRange = M_PI_2;
	fire.emissionRange = 0;

	fire2.scaleRange = 0.8;
	fire2.scale = 1;
    fire2.scaleSpeed = 0.5;
	
    fire2.spin = 3;
	
	fire2.redRange = 100;
	fire2.greenRange = 20;
	fire2.blueRange = 5;
	///////////////////////
	
	
	fire.emitterCells = [NSArray arrayWithObject:fire2];
	
	fireEmitter.renderMode = kCAEmitterLayerAdditive;
    //fireEmitter.renderMode = kCAEmitterLayerUnordered;

	//add the cell to the layer and we're done
   // fireEmitter.emitterCells = [NSArray arrayWithObjects:fire, fire2, nil];
    fireEmitter.emitterCells = [NSArray arrayWithObjects:fire, nil];
    
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

-(void)setEmitterPositionFromTouch: (UITouch*)t
{
    //change the emitter's position
    fireEmitter.emitterPosition = [t locationInView:self];
	NSLog([NSString stringWithFormat:@"%0.2f, %0.2f", fireEmitter.emitterPosition.x,fireEmitter.emitterPosition.y]);
}

-(void)setIsEmitting:(BOOL)isEmitting
{
    //turn on/off the emitting of particles
    [fireEmitter setValue:[NSNumber numberWithInt:isEmitting?50:0] forKeyPath:@"emitterCells.fire.birthRate"];
    //[fireEmitter setValue:[NSNumber numberWithInt:isEmitting?500:0] forKeyPath:@"emitterCells.fire2.birthRate"];
}



@end
