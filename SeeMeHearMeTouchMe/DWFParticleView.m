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
    CAEmitterLayer* particleEmitter; //1
}

-(void)awakeFromNib
{
	//[self effectStars:self];
	[self effectFire:self];
	
    
}

+ (Class) layerClass //3
{
    //configure the UIView to have emitter layer
    return [CAEmitterLayer class];
}

-(void)setEmitterPositionFromTouch: (UITouch*)t
{
    //change the emitter's position
    particleEmitter.emitterPosition = [t locationInView:self];
	NSLog([NSString stringWithFormat:@"%0.2f, %0.2f", particleEmitter.emitterPosition.x,particleEmitter.emitterPosition.y]);
}

-(void)setIsEmitting:(BOOL)isEmitting
{
    //turn on/off the emitting of particles
    [particleEmitter setValue:[NSNumber numberWithInt:isEmitting?birthRate:0] forKeyPath:@"emitterCells.emitter1.birthRate"];
    //[fireEmitter setValue:[NSNumber numberWithInt:isEmitting?500:0] forKeyPath:@"emitterCells.fire2.birthRate"];
}


- (IBAction)effectStars:(id)sender
{
	//set ref to the layer
	particleEmitter = (CAEmitterLayer*)self.layer; //2
	//configure the emitter layer
	particleEmitter.emitterPosition = CGPointMake(50, 50);
	particleEmitter.emitterSize = CGSizeMake(10, 10);

	birthRate = 20;
	
	CAEmitterCell* emitter1 = [CAEmitterCell emitterCell];
	emitter1.birthRate = 0;
	emitter1.lifetime = 3.0;
	emitter1.lifetimeRange = 0.5;
	emitter1.color = [[UIColor colorWithRed:0.8 green:0.6 blue:0.4 alpha:1.0] CGColor];
	//fire.color = [[[UIColor greenColor] colorWithAlphaComponent:0.1] CGColor];
	emitter1.contents = (id)[[UIImage imageNamed:@"star3.png"] CGImage];
	[emitter1 setName:@"emitter1"];

	emitter1.velocity = 10;
	emitter1.velocityRange = 20;

	emitter1.emissionLatitude = M_PI_2;
	emitter1.emissionLongitude = 0;//M_PI_2;
	emitter1.emissionRange = M_2_PI;
	emitter1.emissionRange = 0;

	emitter1.scaleSpeed = 0.3;
	emitter1.spin = 0.5;
	emitter1.spinRange = 0.5;

	emitter1.redRange = 0.8;
	emitter1.greenRange = 0.8;
	emitter1.blueRange = 0.8;


///////////////////
CAEmitterCell* emitter2 = [CAEmitterCell emitterCell];
emitter2.birthRate = 100;
emitter2.lifetime = 0.50;
emitter2.lifetimeRange = 0.25;
emitter2.color = [[UIColor colorWithRed:1.0 green:0.8 blue:0.4 alpha:0.2] CGColor];
emitter2.contents = (id)[[UIImage imageNamed:@"sub_particle1.png"] CGImage];
[emitter2 setName:@"emitter2"];

emitter2.velocity = 300;
emitter2.velocityRange = 10;

emitter2.emissionLatitude = M_PI;
emitter2.emissionLongitude = 0;//M_PI_2;
emitter2.emissionRange = M_PI_2;
emitter1.emissionRange = 0;

emitter2.scaleRange = 0.2;
emitter2.scale = 0.3;
emitter2.scaleSpeed = 0.5;

emitter2.spin = 3;

emitter2.redRange = 0.2;
emitter2.greenRange = 0.2;
emitter2.blueRange = 0.2;
///////////////////////


emitter1.emitterCells = [NSArray arrayWithObject:emitter2];

particleEmitter.renderMode = kCAEmitterLayerAdditive;
//fireEmitter.renderMode = kCAEmitterLayerUnordered;

//add the cell to the layer and we're done
// fireEmitter.emitterCells = [NSArray arrayWithObjects:fire, fire2, nil];
particleEmitter.emitterCells = [NSArray arrayWithObjects:emitter1, nil];


}

- (IBAction)effectZZZ:(id)sender
{
    //set ref to the layer
    particleEmitter = (CAEmitterLayer*)self.layer; //2
    //configure the emitter layer
    particleEmitter.emitterPosition = CGPointMake(50, 50);
    particleEmitter.emitterSize = CGSizeMake(10, 10);
    birthRate = 10;
    
    
    
    ///////////////////
    CAEmitterCell* heartEmitter = [CAEmitterCell emitterCell];
    heartEmitter.birthRate = 0.0;
    heartEmitter.lifetime = 3.5;
    heartEmitter.lifetimeRange = 0.5;
    heartEmitter.color = [[UIColor colorWithRed:0.4 green:0.2 blue:0.8 alpha:0.8] CGColor];
    heartEmitter.contents = (id)[[UIImage imageNamed:@"zzz1.png"] CGImage];
    [heartEmitter setName:@"emitter1"];
    
    heartEmitter.velocity = 50;
    heartEmitter.velocityRange = 100;
    
    heartEmitter.emissionLatitude = M_PI_2;
    heartEmitter.emissionLongitude = 0;//M_PI_2;
    heartEmitter.emissionRange = M_PI_2;
    heartEmitter.emissionRange = M_PI;
    
    heartEmitter.scaleSpeed = 0.5;
    heartEmitter.spin = 0;
    heartEmitter.redRange = .3;
    heartEmitter.greenRange = .1;
    heartEmitter.blueRange = .1;
    ///////////////////////
    
    particleEmitter.renderMode = kCAEmitterLayerAdditive;
    //fireEmitter.renderMode = kCAEmitterLayerUnordered;
    
    //add the cell to the layer and we're done
    particleEmitter.emitterCells = [NSArray arrayWithObjects:heartEmitter, nil];
    
} 

- (IBAction)effectFire:(id)sender
{
    //set ref to the layer
    particleEmitter = (CAEmitterLayer*)self.layer; //2
    //configure the emitter layer
    particleEmitter.emitterPosition = CGPointMake(50, 50);
    particleEmitter.emitterSize = CGSizeMake(10, 10);
	birthRate = 200;
    
    CAEmitterCell* fire = [CAEmitterCell emitterCell];
    fire.birthRate = 0;
    fire.lifetime = 3.0;
    fire.lifetimeRange = 0.5;
    fire.color = [[UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1] CGColor];
	//fire.color = [[[UIColor greenColor] colorWithAlphaComponent:0.1] CGColor];
    fire.contents = (id)[[UIImage imageNamed:@"Particles_fire.png"] CGImage];
    [fire setName:@"emitter1"];
	
    fire.velocity = 10;
    fire.velocityRange = 20;
	
	fire.emissionLatitude = M_PI_2;
	fire.emissionLongitude = 0;//M_PI_2;
	fire.emissionRange = M_PI_2;
    
    fire.scaleSpeed = 0.3;
    fire.spin = 0.5;
	
#if 0    
	///////////////////
	CAEmitterCell* fire2 = [CAEmitterCell emitterCell];
    fire2.birthRate = 20;
    fire2.lifetime = 1.0;
    fire2.lifetimeRange = 0.5;
    fire2.color = [[UIColor colorWithRed:0.3 green:0.84 blue:0.2 alpha:0.8] CGColor];
	fire2.contents = (id)[[UIImage imageNamed:@"heart1.png"] CGImage];
    [fire2 setName:@"fire2"];
	
    fire2.velocity = 100;
    fire2.velocityRange = 20;
	
	fire2.emissionLatitude = M_PI_2;
	fire2.emissionLongitude = 0;//M_PI_2;
    fire2.emissionRange = M_PI_2;
    
    fire2.scaleSpeed = 0.5;
    fire2.spin = 3;
	fire2.redRange = 100;
	fire2.greenRange = 20;
	fire2.blueRange = 5;
	///////////////////////
#endif
	
    particleEmitter.renderMode = kCAEmitterLayerAdditive;
    //fireEmitter.renderMode = kCAEmitterLayerUnordered;
	
	//add the cell to the layer and we're done
    particleEmitter.emitterCells = [NSArray arrayWithObjects:fire, nil];
    
}


- (IBAction)effectHearts:(id)sender
{
    //set ref to the layer
    particleEmitter = (CAEmitterLayer*)self.layer; //2
    //configure the emitter layer
    particleEmitter.emitterPosition = CGPointMake(50, 50);
    particleEmitter.emitterSize = CGSizeMake(10, 10);
	birthRate = 200;
    
    
    
	///////////////////
	CAEmitterCell* heartEmitter = [CAEmitterCell emitterCell];
    heartEmitter.birthRate = 0.0;
    heartEmitter.lifetime = 1.0;
    heartEmitter.lifetimeRange = 0.5;
    heartEmitter.color = [[UIColor colorWithRed:0.3 green:0.84 blue:0.2 alpha:0.8] CGColor];
	heartEmitter.contents = (id)[[UIImage imageNamed:@"heart1.png"] CGImage];
    [heartEmitter setName:@"emitter1"];
	
    heartEmitter.velocity = 100;
    heartEmitter.velocityRange = 20;
	
	heartEmitter.emissionLatitude = M_PI_2;
	heartEmitter.emissionLongitude = 0;//M_PI_2;
    heartEmitter.emissionRange = M_PI_2;
    
    heartEmitter.scaleSpeed = 0.5;
    heartEmitter.spin = 3;
	heartEmitter.redRange = 100;
	heartEmitter.greenRange = 20;
	heartEmitter.blueRange = 5;
	///////////////////////
	
    particleEmitter.renderMode = kCAEmitterLayerAdditive;
    //fireEmitter.renderMode = kCAEmitterLayerUnordered;
	
	//add the cell to the layer and we're done
    particleEmitter.emitterCells = [NSArray arrayWithObjects:heartEmitter, nil];
    
}

- (IBAction)effectLOL:(id)sender
{
    //set ref to the layer
    particleEmitter = (CAEmitterLayer*)self.layer; //2
    //configure the emitter layer
    particleEmitter.emitterPosition = CGPointMake(50, 50);
    particleEmitter.emitterSize = CGSizeMake(10, 10);
	birthRate = 10;
    
    
    
	///////////////////
	CAEmitterCell* heartEmitter = [CAEmitterCell emitterCell];
    heartEmitter.birthRate = 0.0;
    heartEmitter.lifetime = 1.0;
    heartEmitter.lifetimeRange = 0.5;
    heartEmitter.color = [[UIColor colorWithRed:0.3 green:0.84 blue:0.2 alpha:0.8] CGColor];
	heartEmitter.contents = (id)[[UIImage imageNamed:@"LOL1.png"] CGImage];
    [heartEmitter setName:@"emitter1"];
	
    heartEmitter.velocity = 100;
    heartEmitter.velocityRange = 100;
	
	heartEmitter.emissionLatitude = M_PI_2;
	heartEmitter.emissionLongitude = 0;//M_PI_2;
    heartEmitter.emissionRange = M_PI_2;
    heartEmitter.emissionRange = M_PI;
    
    heartEmitter.scaleSpeed = 0.5;
    heartEmitter.spin = .1;
	heartEmitter.redRange = .1;
	heartEmitter.greenRange = .1;
	heartEmitter.blueRange = .1;
	///////////////////////
	
    particleEmitter.renderMode = kCAEmitterLayerAdditive;
    //fireEmitter.renderMode = kCAEmitterLayerUnordered;
	
	//add the cell to the layer and we're done
    particleEmitter.emitterCells = [NSArray arrayWithObjects:heartEmitter, nil];
    
}



@end
