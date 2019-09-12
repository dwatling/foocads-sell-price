GameTooltip:HookScript("OnTooltipSetItem", function(tooltip)
	if not tooltip then return end
	if MerchantFrame:IsShown() then return end

	local _, itemLink = tooltip:GetItem()
	if not itemLink then return end

	local price = select(11, GetItemInfo(itemLink))
	if bagID and slotID then
		local _, qty = GetContainerItemInfo(bagID, slotID)
		if qty > 0 then
			price = price * qty
		end
	end

	if not price or price == 0 then return end

	SetTooltipMoney(tooltip, price, nil, nil)
end)

hooksecurefunc("ContainerFrameItemButton_OnEnter", function(self)
	bagID = self:GetParent():GetID()
	slotID = self:GetID()
end)

hooksecurefunc("ContainerFrameItemButton_OnLeave", function(self)
	bagID = nil
	slotID = nil
end)

