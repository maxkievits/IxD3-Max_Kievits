#pragma once

#include "ofMain.h"
#import "ofxSQLiteCpp.h"

class ofApp : public ofBaseApp{
    
public:
    void setup();
    void update();
    void draw();
    
    void keyPressed(int key);
    void mouseMoved(int x, int y );
    
private:
    SQLite::Database *db;
    ofTrueTypeFont font;
    
    int yearIndex = 0;
    
    // 0: 1820
    // 1: 1910
    // 2: 1945
    // 3: 1968
    // 4: 2005
    int years[5] = {1820, 1910, 1945, 1968, 2005};
    int population_AU[5] = {5, 7, 12, 24, 32};
    int population_NL[5] = {8, 7, 9, 11, 17};
    int population_ZH[5] = {15, 20, 18, 34, 62};
    
    float lerpYear;
    float popAULerpValue;
    float popNLLerpValue;
    float popZHLerpValue;
    
    //        float income_AU[]
    //        float income_NL[]
    //        float income_ZH[]
    // etc...
};
