#include "my_sandbox/include/MySandbox.h"
#include "ogre3d/include/OgreException.h"

#define WIN32_LEAN_AND_MEAN
#include "windows.h"

int main() {
	MySandbox application;
	try {
		application.Run();
	}
	catch (Ogre::Exception& error) {
		MessageBox(
			NULL,
			error.getFullDescription().c_str(),
			"An exception has occurred!",
			MB_OK | MB_ICONERROR | MB_TASKMODAL);
	}
}