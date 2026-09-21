# 资料来源 / Sources

本仓库是趣味技术实验，不是完整的计算机史教材。时间线只选了少量代表性节点，并优先引用官方机构、公司或大学资料。

## 计算机史节点

### ENIAC — 1943–1945

University of Pennsylvania / computer architecture history material records ENIAC as a 1943–45 project and describes it as an early operational general-purpose electronic computing machine.

- https://www.seas.upenn.edu/~leebcc/teachdir/ece252_fall12/ece552-L02-history.pdf

### 集成电路 — 1958

Texas Instruments states that TI engineer Jack Kilby developed the first integrated circuit in 1958.

- https://www.ti.com/about-ti/behind-chip/articles/the-best-is-yet-to-come-the-legacy-of-the-integrated-circuit-in-tomorrows-breakthroughs.html

### Intel 4004 — 1971

Intel records November 15, 1971 as the announcement of the 4004 general-purpose programmable microprocessor.

- https://timeline.intel.com/1971/the-first-programmable-microprocessor:-the-4004

### IBM PC — 1981

IBM records the unveiling of the IBM PC on August 12, 1981.

- https://www.ibm.com/history/personal-computer

### World Wide Web — 1989–1991

CERN records that Tim Berners-Lee invented the Web in 1989, had the first server/browser running by the end of 1990, and released WWW software in 1991.

- https://home.cern/science/computing/the-birth-of-the-web/short-history-web/
- https://home.cern/science/computing/the-birth-of-the-web/

### Git — 2005

The official Pro Git book describes Git as being created in 2005 after the Linux kernel community's relationship with BitKeeper broke down.

- https://git-scm.com/book/en/v2/Getting-Started-A-Short-History-of-Git

### iPhone / smartphone milestone — 2007

Apple announced the original iPhone on January 9, 2007.

- https://www.apple.com/newsroom/2007/01/09Apple-Reinvents-the-Phone-with-iPhone/

### ChatGPT / generative AI public milestone — 2022

OpenAI introduced ChatGPT publicly on November 30, 2022. In this repository, 2022 is used as a representative milestone for generative AI entering broad public use, not as the “invention date” of generative AI.

- https://openai.com/index/chatgpt/

## Git date behavior

Git's official `git-commit` documentation defines its internal date format as:

```text
<unix-timestamp> <time-zone-offset>
```

and describes the timestamp as seconds since the UNIX epoch.

- https://git-scm.com/docs/git-commit

## About the 1945 → 1970 experiment

The GitHub behavior described in this repository was observed directly while building this demo:

- requested API author date: `1945-12-10T09:00:00Z`
- returned author date: `1970-01-01T00:00:00Z`

This observation is included as an experiment result, not as a claim that every Git implementation or every possible low-level object construction must behave identically.

---

If you spot a historical simplification that should be improved, an issue or pull request is welcome.
