command = {}

function mkDirs(path)
    os.execute('mkdir "' .. path .. '"')
end

function read_file(path)
    local text = ""
    local file = io.open(path, "r") -- 打开了文件读写路径
    if (file ~= nil) then -- 如果文件不是空的
        text = file.read(file, "*a") -- 读取内容
        io.close(file) -- 关闭文件
    else
        text = "获取失败 X"
    end
    return text
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
    return "DokiMod 插件 初始化成功"
end

function dokimod_board(msg)
    boardPath = dice.DiceDir() .. "\\dokimod_ext\\board\\"
    FilePath = boardPath .. "board.txt"
    if(dice.mkDir(boardPath) == 0)
    then
        url = "https://cdn.jsdelivr.net/gh/DokiMod/Mitana-API@main/announcement"
        rv = dice.fDownWebPage(url, FilePath)
        if (rv == 0) then
            board = read_file(FilePath)
            return board
        else
            return "获取失败 X" -- help me fix it
        end
    end
end

-- function dokimod_apply(Msg)
-- end

-- command["(\\.|。)dokimod[\\s\\S]*"] = "dokimod_about"
command["(\\.|。)dokimod\\s?(about|info)?"] = "dokimod_about"
command["(\\.|。)dokimod\\s(init)"] = "dokimod_init"
command["(\\.|。)dokimod\\s(board|announce|announcement)"] = "dokimod_board"