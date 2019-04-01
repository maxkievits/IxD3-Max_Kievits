#include "ofApp.h"
#include "ofxJSON.h"
#include "ofxSQLiteCpp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    download();
}

//--------------------------------------------------------------
void ofApp::update(){

    ofLog() << "Datum van element #" << jsonIndex << " : " << json["list"][jsonIndex]["dt_txt"] << endl;
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    //ofClear(0);
    ofDrawBitmapString(json["list"][jsonIndex]["dt_txt"].asString(), 10, ofGetWindowHeight() - 50);
    
    ofSetColor(ofColor::blue);
    //ofDrawCircle(100, 100, json["list"][jsonIndex]["main"]["temp"].asInt() * 10);
    
    tempLerpValue = ofLerp(tempLerpValue, json["list"][jsonIndex]["main"]["temp"].asInt(), 0.025);
    ofDrawRectangle(10, ofGetWindowHeight() / 2, 50, -1 * (tempLerpValue * 10));
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){

}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){
    if (json["cnt"].asInt() > 0) {
        jsonIndex = ofMap(x,0,ofGetWindowWidth(),0,json["cnt"].asInt());
    } else {
        jsonIndex = 0;
    }
}

void ofApp::download() {
    std::string url = "http://api.openweathermap.org/data/2.5/forecast?q=Amersfoort&APPID=d24e24092f9a94d2cd472a1c6d0d3380&units=metric";
    
    // Now parse the JSON
    bool success = json.open(url);
    
    if (success)
    {
        int elementCount = json["cnt"].asInt();
        ofLog() << json["cnt"].asInt() << " elementen gekregen" << endl;
        
        for (int i = 0; i < elementCount; i++) {
            //ofLog() << "Datum van element #" << i << " : " << json["list"][i]["dt_txt"] << endl;
            
        }
    }
    else
    {
        ofLogNotice("ofApp::setup")  << "Failed to parse JSON" << endl;
    }
}
