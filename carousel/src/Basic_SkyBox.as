/*

 SkyBox example in Away3d

 Demonstrates:

 How to use a CubeTexture to create a SkyBox object.
 How to apply a CubeTexture to a material as an environment map.

 Code by Rob Bateman
 rob@infiniteturtles.co.uk
 http://www.infiniteturtles.co.uk

 This code is distributed under the MIT License

 Copyright (c)

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the “Software”), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.

 */

package {
import away3d.cameras.lenses.*;
import away3d.containers.*;
import away3d.controllers.HoverController;
import away3d.entities.*;
import away3d.lights.PointLight;
import away3d.materials.*;
import away3d.materials.methods.*;
import away3d.primitives.*;
import away3d.textures.*;
import away3d.utils.*;

import flash.display.*;
import flash.events.*;
import flash.geom.Vector3D;
import flash.ui.Keyboard;

public class Basic_SkyBox extends Sprite {
    // Environment map.
    [Embed(source="../bin/skybox/snow_positive_x.jpg")]
    private var EnvPosX:Class;
    [Embed(source="../bin/skybox/snow_positive_y.jpg")]
    private var EnvPosY:Class;
    [Embed(source="../bin/skybox/snow_positive_z.jpg")]
    private var EnvPosZ:Class;
    [Embed(source="../bin/skybox/snow_negative_x.jpg")]
    private var EnvNegX:Class;
    [Embed(source="../bin/skybox/snow_negative_y.jpg")]
    private var EnvNegY:Class;
    [Embed(source="../bin/skybox/snow_negative_z.jpg")]
    private var EnvNegZ:Class;
    [Embed(source="../bin/skybox/cup-skin.jpg")]
    private var CupSkin:Class;

    //engine variables
    private var _view:View3D;

    //scene objects
    private var _skyBox:SkyBox;
    private var _torus:Mesh;

    // Private.
    private var _light:PointLight;


    private var _cubeTexture:BitmapCubeTexture;

    /**
     * Constructor
     */
    public function Basic_SkyBox() {

        initStage();
        _view = new View3D();
        addChild(_view);

        //setup the camera
        _view.camera.y = 0;
        _view.camera.z = 0;
        _view.camera.lens = new PerspectiveLens(90);
        //createSkyBox();
        //setup the render loop
        //addEventListener(Event.ENTER_FRAME, _onEnterFrame);

        addEventListener(Event.ENTER_FRAME, enterframeHandler);
        stage.addEventListener(Event.RESIZE, onResize);
        initKeyboardControl();

        _light = new PointLight();


        initContent();

        onResize();


    }


    private function initKeyboardControl():void {
        stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownListener)
    }

    private function keyDownListener(e:KeyboardEvent):void {
        var value:int = 10;
        switch (e.keyCode) {
            case Keyboard.A:
                _planeRX += value;
                break;
            case Keyboard.Z:
                _planeRX -= value;
                break;
            case Keyboard.S:
                _planeRZ += value;
                break;
            case Keyboard.X:
                _planeRZ -= value;
                break;
            case Keyboard.D:
                _planeRY += value;
                break;
            case Keyboard.C:
                _planeRY -= value;
                break;

        }

        trace("x: " + _planeRX + ", z: " + _planeRZ + ", y: " + _planeRY);
        _plane.rotateTo(_planeRX, _planeRY, _planeRZ);
    }

    private function initCameraContoller(lookAtObject:ObjectContainer3D = null):void {
        // Camera.
        _cameraController = new HoverController(_view.camera, lookAtObject, 0, 0, 300);
        _cameraController.yFactor = 1;

    }

    private var _cup:Cup;

    private function initContent():void {

        var material:ColorMaterial = new ColorMaterial();
        material.addMethod(new EnvMapMethod(_cubeTexture, 1));
        createCup();
        //createCarousel();
        createSkyBox();
        initCameraContoller();

    }

    private var _plane:Mesh;
    private var _planeRX:int = 0;
    private var _planeRY:int = 0;
    private var _planeRZ:int = 0;

    private function createCarousel():void {
        // var bitmapMaterial:TextureMaterial = new TextureMaterial(Cast.bitmapTexture(EnvNegX));
        var bitmapMaterial:ColorMaterial = new ColorMaterial(0xEEEEEE);
        //bitmapMaterial.addMethod(new EnvMapMethod(_cubeTexture, .2));
        var imageCount:int = 12;
        var radius:int = 100;
        for (var i:int = imageCount; i >= 0; i--) {


            // Position the new plane in the scene: album covers are arranged in a circle.
            var step:Number = (360 / imageCount) * (i - 1);
            var radian:Number = deg2rad(step);
            // plane.x =
            // plane.z =
            //plane.y = -50;


            var plane:Mesh = new Mesh(new PlaneGeometry(50, 50, 2, 2, true, true), bitmapMaterial);

            plane.rotateTo(-90, -step + 90, 0);
            plane.x = Math.cos(radian) * radius;
            plane.z = Math.sin(radian) * radius;
            _view.scene.addChild(plane);

        }
    }

    private function deg2rad(degree:Number):Number {
        // Convert degrees into radians
        return degree * (Math.PI / 180);
    }

    private function createSkyBox():void {
        _cubeTexture = new BitmapCubeTexture(Cast.bitmapData(EnvPosX), Cast.bitmapData(EnvNegX), Cast.bitmapData(EnvPosY), Cast.bitmapData(EnvNegY), Cast.bitmapData(EnvPosZ), Cast.bitmapData(EnvNegZ));

        //setup the environment map material
        var material:ColorMaterial = new ColorMaterial();
        material.addMethod(new EnvMapMethod(_cubeTexture, .5));


        _skyBox = new SkyBox(_cubeTexture);
        _view.scene.addChild(_skyBox);
    }

    private function createCup():void {
        var bitmapMaterial:TextureMaterial = new TextureMaterial(Cast.bitmapTexture(CupSkin));
        //bitmapMaterial.addMethod(new EnvMapMethod(_cubeTexture, .1));


        _cup = new Cup();
        trace("hallo world ");
        _cup.materialMesh = bitmapMaterial;
        _view.scene.addChild(_cup);
        //_view.camera.lookAt(new Vector3D(-10));
        _cup.x = -10;
        _cup.z = 60;
        _cup.y = -60;
    }

    private function initStage():void {
        stage.quality = StageQuality.HIGH_16X16_LINEAR;
        stage.frameRate = 40;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        stage.align = StageAlign.TOP_LEFT;
        stage.addEventListener(MouseEvent.MOUSE_DOWN, stageMouseDownHandler);
        stage.addEventListener(MouseEvent.MOUSE_UP, stageMouseUpHandler);
        stage.addEventListener(MouseEvent.MOUSE_WHEEL, stageMouseWheelHandler);
    }


    // Camera control.
    private var _mouseIsDown:Boolean;
    private var _lastPanAngle:Number;
    private var _lastTiltAngle:Number;
    private var _lastMouseX:Number;
    private var _lastMouseY:Number;
    private var _tiltIncrement:Number = 0;
    private var _panIncrement:Number = 0;

    private const WIDTH:Number = 800;
    private const HEIGHT:Number = 600;

    protected var _cameraController:HoverController;

    private function stageMouseDownHandler(event:MouseEvent):void {
        _mouseIsDown = true;
        _lastPanAngle = _cameraController.panAngle;
        _lastTiltAngle = _cameraController.tiltAngle;
        _lastMouseX = stage.mouseX;
        _lastMouseY = stage.mouseY;
    }

    private function stageMouseWheelHandler(event:MouseEvent):void {
        _cameraController.distance -= event.delta * 5;
        var cameraMinDistance:int = 50;
        var cameraMaxDistance:int = 130;
        if (_cameraController.distance < cameraMinDistance)
            _cameraController.distance = cameraMinDistance;
        else if (_cameraController.distance > cameraMaxDistance)
            _cameraController.distance = cameraMaxDistance;
    }

    private function stageMouseUpHandler(event:MouseEvent):void {
        _mouseIsDown = false;
    }

    private function enterframeHandler(event:Event):void {
        update();
    }

    private function update():void {
        //    onUpdate();
        if (_mouseIsDown) {
            _cameraController.panAngle = 0.4 * ( _view.mouseX - _lastMouseX ) + _lastPanAngle;
           // _cameraController.tiltAngle = 0.4 * ( _view.mouseY - _lastMouseY ) + _lastTiltAngle;
            _cameraController.tiltAngle = 25;
        }
        _cameraController.panAngle += _panIncrement;
        _cameraController.tiltAngle += _tiltIncrement;
        _light.position = _view.camera.position;
        _view.render();
    }

    /**
     * render loop
     */
    private function _onEnterFrame(e:Event):void {
        //_torus.rotationX += 2;
        //_torus.rotationY += 1;

        //_view.camera.position = new Vector3D();
        //_view.camera.rotationY += 0.5*(stage.mouseX-stage.stageWidth/2)/800;
        //_view.camera.moveBackward(600);

        _view.render();
    }

    /**
     * stage listener for resize events
     */
    private function onResize(event:Event = null):void {
        _view.width = stage.stageWidth;
        _view.height = stage.stageHeight;
    }
}
}
