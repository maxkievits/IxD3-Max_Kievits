#pragma once

#include "ofMain.h"
#import "ofxSQLiteCpp.h"
#import "ofxJSON.h"


class ofApp : public ofBaseApp{

public:
    void setup();
    void update();
    void draw();
    void download();
    
    void keyPressed(int key);
    void mouseMoved(int x, int y );
    
private:
    SQLite::Database *db;
    ofxJSONElement result;
    		
};
