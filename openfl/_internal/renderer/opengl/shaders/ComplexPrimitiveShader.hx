package openfl._internal.renderer.opengl.shaders ;


import lime.graphics.GLProgram;
import lime.graphics.GLRenderContext;
import lime.graphics.GLUniformLocation;


class ComplexPrimitiveShader extends AbstractShader {
	
	
	public var alpha:GLUniformLocation;
	public var aVertexPosition:Int;
	public var color:GLUniformLocation;
	public var colorAttribute:Int;
	public var offsetVector:GLUniformLocation;
	public var projectionVector:GLUniformLocation;
	public var tintColor:GLUniformLocation;
	public var translationMatrix:GLUniformLocation;
	
	
	public function new (gl:GLRenderContext) {
		
		super (gl);
		
		fragmentSrc = [
			'precision mediump float;',
			'varying vec4 vColor;',
			'void main(void) {',
			'   gl_FragColor = vColor;',
			'}'
		];
		
		vertexSrc  = [
			'attribute vec2 aVertexPosition;',
			//'attribute vec4 aColor;',
			'uniform mat3 translationMatrix;',
			'uniform vec2 projectionVector;',
			'uniform vec2 offsetVector;',
			
			'uniform vec3 tint;',
			'uniform float alpha;',
			'uniform vec3 color;',
			
			'varying vec4 vColor;',
			
			'void main(void) {',
			'   vec3 v = translationMatrix * vec3(aVertexPosition , 1.0);',
			'   v -= offsetVector.xyx;',
			'   gl_Position = vec4( v.x / projectionVector.x -1.0, v.y / -projectionVector.y + 1.0 , 0.0, 1.0);',
			'   vColor = vec4(color * alpha * tint, alpha);',//" * vec4(tint * alpha, alpha);',
			'}'
		];
		
		init ();
		
	}
	
	
	public override function init ():Void {
		
		super.init ();
		
		var gl = this.gl;
		
		projectionVector = gl.getUniformLocation (program, 'projectionVector');
		offsetVector = gl.getUniformLocation (program, 'offsetVector');
		tintColor = gl.getUniformLocation (program, 'tint');
		color = gl.getUniformLocation (program, 'color');
		
		aVertexPosition = gl.getAttribLocation (program, 'aVertexPosition');
		
		attributes = [ aVertexPosition, colorAttribute];
		
		translationMatrix = gl.getUniformLocation (program, 'translationMatrix');
		alpha = gl.getUniformLocation (program, 'alpha');
		
	}
	
	
}