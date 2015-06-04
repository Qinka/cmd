import Distribution.Simple
import System.IO
import System.Directory
import Data.List
import System.Environment
main = do
    --your
    (x:_) <- getArgs
    if x == "configure" then do
            dir <- getAppUserDataDirectory "GiveYouAHead"
            isE <- doesDirectoryExist dir
            if isE == True then putStrLn "" else createDirectory dir
            isE <- doesDirectoryExist (dir++"/data")
            if isE == True then putStrLn "" else createDirectory (dir++"/data")
            isE <- doesDirectoryExist (dir++"/data/shell")
            if isE == True then putStrLn "" else createDirectory (dir++"/data/shell")
            hD <- openFile (dir++"/data/delList.dat") ReadMode
            stSrc <- hGetLine hD
            hClose hD
            writeFile (dir ++ "/data/delList.dat") (show$dropRepeated$sort((read stSrc ::[String])++dL))
            writeFile (dir ++ "/data/shell/cmd.cmap") (show shell)
            defaultMain
    --your end
        else
            defaultMain
    where
    shell = [
        ("*Del","del"),
        ("*DelForce"," /F"),
        ("*DelQuite","/Q"),
        ("*ShellFileBack",".bat"),
        ("*SysShellRun"," "),
        ("*MakefileBegin","@echo off\n"),
        ("*MakefileEnd","del .makefile.bat\n"),
        ("*ExecutableFE","exe")
        ]
    dL = ["*.exe"]

dropRepeated :: (Eq a)=> [a] -> [a]
dropRepeated [] = []
dropRepeated (x:[]) = [x]
dropRepeated (x:y:xs)
    | x == y = dropRepeated (x:xs)
    | otherwise = x:dropRepeated (y:xs)
