function Sandbox_Cleanup(sandbox)
end

function Sandbox_HandleEvent(sandbox, event)
end

function Sandbox_Initialize(sandbox)
    local plane = Sandbox.CreatePlane(sandbox, 200, 200)
    Core.SetMaterial(plane, "Ground2")
    
    local directional = Core.CreateDirectionalLight(
        sandbox, Vector.new(1, -1, 1));
    Core.SetLightDiffuse(
        directional, Vector.new(1.8, 1.4, 0.9));
    Core.SetLightSpecular(
        directional, Vector.new(1.8, 1.4, 0.9));
        
    Sandbox.CreateSkyBox(
        sandbox,
        "ThickCloudsWaterSkyBox",
        Vector.new(0, 180, 0));
        
    local object = Core.CreateMesh(
        sandbox, "models/nobiax_modular/modular_block.mesh");
    Core.SetMass(object, 15);
    Core.SetPosition(object, Vector.new(5, 5, 0));
    Core.SetRotation(object, Vector.new(0, 90, 0));
    
    Sandbox.CreateAgent(sandbox, "Agent.lua");
        
end

function Sandbox_HandleEvent(sandbox, event)
	if (event.source == "keyboard" and
		event.pressed and event.key == "space_key" ) then
		
		local block = Sandbox.CreateObject(
			sandbox,
			"models/nobiax_modular/modular_block.mesh");
			
		local cameraPosition = 
			Sandbox.GetCameraPosition(sandbox);
		local cameraForward = 
			Sandbox.GetCameraForward(sandbox);
		local blockPosition = cameraPosition + cameraForward * 2;
		local rotation = Sandbox.GetCameraOrientation(sandbox);
		
		Core.SetMass(block, 15);
		Core.SetRotation(block, rotation)
		Core.SetPosition(block, blockPosition);
		
		Core.ApplyImpulse(
			block, Vector.new(cameraForward * 1500));
		Core.ApplyAngularImpulse(
			block, Sandbox.GetCameraLeft(sandbox) * 10);
	end
		
end

function Sandbox_Update(sandbox, deltaTimeInmillis)
end