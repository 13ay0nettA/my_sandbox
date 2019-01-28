require "AgentUtilities";

function Agent_Cleanup(agent)
end

function Agent_handleEvent(agent, event)
end

function Agent_Initialize(agent)
    AgentUtilities_CreateAgentRepresentation(agent, agent:GetHeight(), agent:GetRadius());
end

function Agent_Update(agent, deltaTimeInMillis)
end