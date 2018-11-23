#version 330 core 

in vec3 vPosition;

uniform mat4 modelMatrix;
uniform mat4 viewMatrix;
uniform mat4 projMatrix;

void main() 
{
	vec4 v1 = modelMatrix*vec4(vPosition, 1.0);  
	// ����modelMatrix�п���Ϊ��Ӱ����Ϊ�˵õ���ȷλ�ã�������Ҫ��һ��͸�ӳ���
	vec4 v2 = vec4(v1.xyz / v1.w, 1.0);
	// ���������ͶӰ
	vec4 v3 = projMatrix*viewMatrix*v2;
	// ����һ��͸�ӳ��� (Ϊ����ȷ���������ʽ��һ��͸�ӳ���)
	vec4 v4 = vec4(v3.xyz / v3.w, 1.0);
	gl_Position = v4;
}