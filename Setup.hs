import Distribution.Simple
import System.IO
import System.Directory
main = do
    --your
    dir <- getAppUserDataDirectory "GiveYouAHead"
    isE <- doesDirectoryExist dir
    if isE == True then putStrLn "" else createDirectory dir
    isE <- doesDirectoryExist (dir++"/data")
    if isE == True then putStrLn "" else createDirectory (dir++"/data")
    isE <- doesDirectoryExist (dir++"/data/shell")
    if isE == True then putStrLn "" else createDirectory (dir++"/data/shell")
    writeFile (dir ++ "/data/shell/cmd.cmap") (show shell)
    --your end
    defaultMain
    where
    shell = [
        ("*Del","del"),
        ("*DelForce"," /F"),
        ("*DelQuite","/Q"),
        ("*DelList","*.hi *.hs~ *.o *.exe"),
        ("*ShellFileBack",".bat"),
        ("*SysShellRun","cmd"),
        
