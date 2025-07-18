const { execSync } = require('child_process');
const fs = require('fs');
/// 获取输入内容
const [commit = "默认的版本更新信息"] = process.argv.slice(2)
var nextVersion = ""
try {
    // 执行 git status 命令
    const gitStatus = execSync('git status').toString();

    // 检查命令输出中是否包含有未提交的变更信息
    if (gitStatus.includes('Changes not staged for commit')) {
        console.log('❌ 本地有未提交的变更 请先处理');
        return
    }

    // 清除本地tag

    execSync('git tag -l | xargs git tag -d')

    // 获取远程tag
    execSync('git fetch --tags')

    // 使用 Git 命令获取当前的 Git 标签
    const currentTag = execSync('git describe --tags --abbrev=0').toString().trim();
    console.log('🕤 当前版本', currentTag);

    // 获取下一个版本标签
    nextVersion = getNextVersion(currentTag)
    console.log('⬇️ 下一个版本', nextVersion);
    // 标签信息
    const tagInfo = `git tag -a ${nextVersion} -m "${commit}"`

    console.log(`标签: [ ${tagInfo} ] \n✅ 点击任意按钮确认推送 \n🙅 输入 n/N 以停止推送`);
    process.stdin.on('data', function (data) {
        try {
            // 输入的内容会通过 data 事件传递给回调函数
            const input = data.toLocaleString().trim().toLowerCase()

            if (input == "n") {
                console.log('❌ 取消推送');
                // 停止监听输入
                process.stdin.pause();
                return
            }

            console.log('✅ 确认推送');

            // 停止监听输入
            process.stdin.pause();


            // 写入readme
            let readme = fs.readFileSync('README.md', 'utf-8')
            const flag = "## 版本记录 🏷️"
            readme = readme.replace(flag, `${flag}\n#### ${nextVersion}\n##### ${new Date().toLocaleDateString()} \n\n>${commit}\n`)
            fs.writeFileSync('README.md', readme)

            // 推送
            execSync(`git add .`)
            execSync(`git commit -m '发行版本${nextVersion}'`)
            // 设置标签
            console.log('🏷️ 设置标签');
            execSync(tagInfo)
            execSync(`git push --follow-tags`)
            console.log('📃 推送结果');

            // setTimeout(() => {
            //     console.log('设置tag');
            //     execSync(`git push origin ${nextVersion}`).toString().trim();
            // }, 1000);

        } catch (error) {
            console.error('Error:', error.message);
            execSync(`git tag -d ${nextVersion}`)
        }
    });

    // 开始监听输入
    process.stdin.resume();
} catch (error) {
    console.error('Error:', error.message);
    execSync(`git tag -d ${nextVersion}`)
}

/** 增加版本号*/
function getNextVersion(currentVersion, maxVersion = 30) {
    // 解析当前版本号
    const [major, minor, patch] = currentVersion.split('.').map(Number);

    // 递增修订版本号
    let nextPatch = patch + 1;
    let nextMinor = minor;
    let nextMajor = major;
    if (nextPatch >= maxVersion) {
        nextPatch = 0;
        nextMinor++;
    }
    if (nextMinor >= maxVersion) {
        nextMinor = 0;
        nextMajor++;
    }

    // 组合下一个版本号
    const nextVersion = `${nextMajor}.${nextMinor}.${nextPatch}`;
    return nextVersion;
}
