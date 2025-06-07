import os, time, subprocess
def update_script(default_commit_message:str, origin:str, branch:str):
    date = f"[{time.strftime('%Y%m%d')}.{time.strftime('%H%M%S')}]"    
    git_message = f"COMMIT: {default_commit_message}, VERSION: {date}, ORIGIN: {origin}, BRANCH: {branch}"
    print(f"Updating script with message: {git_message}")
    subprocess.run(["git", "status"])
    subprocess.run(["git", "add", "."])
    subprocess.run(["git", "commit", "-m", git_message])
    subprocess.run(["git", "push", origin, branch])
def main():
    print("Welcome to the script updater!")
    default_commit_message = str(input("Enter the default commit message: "))
    origin = str(input("Enter the git origin (default: origin): ") or "origin")
    branch = str(input("Enter the git branch (default: main): ") or "main")
    if not os.path.exists(".git"):
        print("This directory is not a git repository.")
        return
    update_script(default_commit_message, origin, branch)

main()