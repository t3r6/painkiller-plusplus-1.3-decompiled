o.OnInitTemplate = CItem.StdOnInitTemplate

function C2L5_Balkonik:OnCreateEntity()
    MDL.SetRagdollLinearDamping(self._Entity,0.99)
    MDL.SetRagdollAngularDamping(self._Entity,0.99)
    MDL.EnableRagdoll(self._Entity,true,ECollisionGroups.RagdollNonColliding)
end

