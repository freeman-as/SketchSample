float GRAVITY = 3;
float FRICTION = 0.8;

public class BounceBall{
    
    // メンバ変数
    float _x, _y;
    float _spx, _spy;
    float _radius;
    color _ballColor;

    BounceBall(float x, float y, float spx, float spy, float radius, color ballColor){
        _x = x;
        _y = y;
        _spx = spx;
        _spy = spy;
        _radius = radius;
        _ballColor = ballColor;
    }
    
    public void move(){
        _spy += GRAVITY;
        _x += _spx;
        _y += _spy;
        
        this.bounce();
    }
    
    public void draw(){
        noStroke();
        fill(_ballColor);
        ellipse(_x, _y, _radius*2, _radius*2);
    }
    
    public void bounce(){
        float bounceMinX = _radius;
        float bounceMaxX = width - _radius;
        //float bounceMinY = _radius;
        float bounceMaxY = height - _radius;
        
        if(_x < bounceMinX || _x > bounceMaxX){
            _spx = -_spx * FRICTION;
            //if(abs(_spx) < 1) _spx = 0;
            if(_x < bounceMinX) _x = bounceMinX - (_x - bounceMinX); 
            if(_x > bounceMaxX) _x = bounceMaxX - (_x - bounceMaxX);
        }
    
        if(_y > bounceMaxY){
            _spy = -_spy * FRICTION;
            //if(abs(_spy) < GRAVITY) _spy = 0;
            //if(_y < bounceMinY) _y = bounceMinY - (_y - bounceMinY); 
            if(_y > bounceMaxY) _y = bounceMaxY - (_y - bounceMaxY);
        }
    }
}