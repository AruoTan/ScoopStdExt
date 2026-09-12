using System;
using System.Diagnostics;
using System.IO;
using System.Text.RegularExpressions;

internal static class ZoteroPortable
{
    // Escape arguments using Windows command-line quoting rules, without a shell.
    private static string Quote(string value)
    {
        string escaped = Regex.Replace(value, "(\\\\*)\"", "$1$1\\\"");
        return "\"" + Regex.Replace(escaped, @"(\\+)$", "$1$1") + "\"";
    }

    private static void Main(string[] args)
    {
        string directory = AppDomain.CurrentDomain.BaseDirectory;
        var start = new ProcessStartInfo(Path.Combine(directory, "zotero.exe"));
        start.UseShellExecute = false;
        start.WorkingDirectory = directory;
        start.EnvironmentVariables["APPDATA"] = Path.Combine(directory, "appdata");
        start.EnvironmentVariables["LOCALAPPDATA"] = Path.Combine(directory, "localappdata");
        start.Arguments = "-profile " + Quote(Path.Combine(directory, "profile"))
            + " -datadir " + Quote(Path.Combine(directory, "data"));
        foreach (string argument in args)
        {
            start.Arguments += " " + Quote(argument);
        }
        using (Process process = Process.Start(start)) { }
    }
}
