package openfl.display3D; #if (!display && !flash)


enum Context3DVertexBufferFormat {
	
	BYTES_4;
	FLOAT_1;
	FLOAT_2;
	FLOAT_3;
	FLOAT_4;
	
}


#else


#if flash
@:native("flash.display3D.Context3DVertexBufferFormat")
#end

@:fakeEnum(String) extern enum Context3DVertexBufferFormat {
	
	BYTES_4;
	FLOAT_1;
	FLOAT_2;
	FLOAT_3;
	FLOAT_4;
	
}


#end