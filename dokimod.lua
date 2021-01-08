command = {}

function mkDirs(path)
    os.execute('mkdir "' .. path .. '"')
end

function dokimod_about(Msg)
    Reply = [[OlivaDice (DIXE) 插件 .DokiMod
版本 v0.1-alpha
made by imgradeone and DokiMod
输入 .dokimod help 查看帮助]]
    return Reply
end

function dokimod_init(msg)
    pathInit = dice.DiceDir() .. "\\dokimod_ext"
    mkDirs(pathInit)
    return "DokiMod 插件 初始化成功（？"
end

function dokimod_board(msg)
    rv = ""
    boardPath = dice.DiceDir() .. "\\dokimod_ext\\board"
    file_path = boardPath .. "hitokoto_" .. dice.int2string(Msg.fromQQ) .. ".json"
    if(dice.mkDir(boardPath) == 0)
    then
        url = "https://dokimod.cn/api/announcement"
        dice.fDownWebPage(url, file_path)
        file = io.open(file_path, "r")
        rv = file:read()
        file:close()
        -- rv = "『" .. dice.fGetJson(file_path, "啥也没有", "hitokoto") .. "』"
        -- rv = rv .. "\n" .. dice.fGetJson(file_path, "不明", "from").. " - " .. dice.fGetJson(file_path, "不明", "from_who")
    end
    return rv
end

-- function dokimod_apply(Msg)
-- end

-- command["(\\.|。)dokimod[\\s\\S]*"] = "dokimod_about"
command["(\\.|。)dokimod\\s?(about|info)?"] = "dokimod_about"
command["(\\.|。)dokimod\\s(init)"] = "dokimod_init"
command["(\\.|。)dokimod\\s(board|announce|announcement)"] = "dokimod_board"