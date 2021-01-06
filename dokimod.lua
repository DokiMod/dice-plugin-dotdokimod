command = {}

function dokimod_about(Msg)
    Reply = [[OlivaDice (DIXE) 插件 .DokiMod
版本 v0.1-alpha
made by imgradeone and DokiMod
输入 .dokimod help 查看帮助]]
    return Reply
end

function dokimod_init(msg)
    path_base = dice.DiceDir() .. "/dokimod"
    if (dice.mkDir(path_base) ~= 0) then
        rv = dice.mkDir(path_base)

end

function dokimod_apply(Msg)
end

-- command["(\\.|。)dokimod[\\s\\S]*"] = "dokimod_about"
command["(\\.|。)dokimod\\s?(about|info)?"] = "dokimod_about"
command["(\\.|。)dokimod\\s(init)"] = "dokimod_init"