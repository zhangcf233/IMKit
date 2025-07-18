const { execSync } = require('child_process');
const fs = require('fs');

// 执行git命令并返回输出
function git(command) {
    return execSync(`git ${command}`, { encoding: 'utf-8' });
}

// 提取标签名称并去除不必要的后缀和尖括号
function extractTagName(remoteTag) {
    let tagName = remoteTag.split('\t')[1].replace('refs/tags/', '');
    tagName = tagName.replace(/\^\{\}/g, ''); // 去除 ^{} 后缀
    tagName = tagName.replace(/<|>/g, ''); // 去除尖括号
    return tagName;
}

// 获取标签描述
function getTagDescription(tag) {
    try {
        const desc = git(`show ${tag} --format=%B --no-patch`).trim();
        
        const msgs = desc.split("\n");

        if (msgs.length === 5) {
            return msgs[3];
        } else {
            return msgs[0];
        }
    } catch (error) {
        console.log(`无法获取标签 ${tag} 的描述：${error}`);
        return '';
    }
}

// 解析版本号
function parseVersion(versionString) {
    return versionString.split('.').map(Number);
}

// 比较版本号
function compareVersions(versionA, versionB) {
    for (let i = 0; i < Math.max(versionA.length, versionB.length); i++) {
        const a = versionA[i] || 0;
        const b = versionB[i] || 0;
        if (a !== b) {
            return a - b;
        }
    }
    return 0;
}

// 生成Markdown文件
function generateMarkdown(tags) {
    // 去重
    const uniqueTags = Array.from(new Set(tags));

    uniqueTags.sort((a, b) => {
        const versionA = parseVersion(extractTagName(a));
        const versionB = parseVersion(extractTagName(b));
        return compareVersions(versionA, versionB);
    });

    let markdown = '';

    uniqueTags.reverse()

    uniqueTags.forEach(tag => {
        const tagName = extractTagName(tag);
        const description = getTagDescription(tagName);
        console.log(tagName,description);
        
        markdown += `#### ${tagName}\n\n>${description}\n\n`;
    });
    return markdown;
}

// 清空本地标签
function clearLocalTags() {
    const localTags = git('tag -l').trim().split('\n');
    localTags.forEach(tag => {
        git(`tag -d ${tag}`);
    });
    console.log('本地标签已清空');
}

// 获取远程仓库所有标签
function getRemoteTags() {
    const tags = git('ls-remote --tags').trim().split('\n');
    var list = []
    tags.forEach(i => {
        if (!i.includes('^{}')) {
            list.push(i)
        }
    })
    return list
}


// 主函数
function main() {
    clearLocalTags()
    git('fetch --tags')
    const remoteTags = getRemoteTags();

    const markdown = generateMarkdown(remoteTags);
    const readme = fs.readFileSync('README.md', 'utf-8');
    /// 截取版本记录
    const flag = "## 版本记录 🏷️"
    const readmeSplit = readme.split(flag)

    if (readmeSplit.length > 1) {
        readmeSplit[1] =  `${flag}\n${markdown}`
    }

    const writeText = readmeSplit.toString().replace(',', '')
    fs.writeFileSync('README.md',  writeText);

    git('add .')
    git("commit -m '更新文档 📃'")
    git("push")
}

main();
