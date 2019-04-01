#pragma once

#include "ofMain.h"
#import "ofxSQLiteCpp.h"
#import "ofxJSON.h"

class ofApp : public ofBaseApp{

	public:
		void setup();
		void update();
		void draw();

		void keyPressed(int key);
		void keyReleased(int key);
		void mouseMoved(int x, int y );
        void download();
    
    private:
        ofxJSONElement json;
    int jsonIndex;
    float tempLerpValue;
		
};
