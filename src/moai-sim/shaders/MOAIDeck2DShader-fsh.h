// Copyright (c) 2010-2011 Zipline Games, Inc. All Rights Reserved.
// http://getmoai.com

#ifndef	MOAIDECK2DSHADER_FSH_H
#define	MOAIDECK2DSHADER_FSH_H

#define SHADER(str) #str

static cc8* _deck2DShaderFSH = SHADER (
	#ifdef GL_ES
	precision mediump int;
	precision mediump float;
	#endif

	varying LOWP vec4 colorVarying;
	varying MEDP vec2 uvVarying;
	
	uniform sampler2D sampler;

	void main () {
		gl_FragColor = texture2D ( sampler, uvVarying ) * colorVarying;
	}
);

#endif