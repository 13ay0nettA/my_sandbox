#include "demo_framework/include/SandboxApplication.h"

class MySandbox : public SandboxApplication {
public:
	MySandbox(void);

	virtual ~MySandbox(void);

	virtual void Initialize();
};