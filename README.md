# cvMax
## Objective
cvMax lets you
* manage your CV in a single file, and
* automatically deploy it to whatever format you need without any extra work.

So instead of managing your CV like this:
```mermaid
flowchart TD
    CV[CV 변경사항 발생]
    CV -- 페이지 수정 --> Notion[Notion]
    CV -- 프로필 수정 --> LinkedIn[LinkedIn]
    CV -- 코드 변경 --> LaTeX[LaTeX] --컴파일--> PDF[PDF]
    CV -- ... --> ...[...]
```

I'm changing it to this to make everyone's life easier:
```mermaid
flowchart TD
    CV[CV 변경사항 발생]
    CV -- 파일 수정 --> YAML[YAML]
    YAML -- 파일 변동 감지 --> Pipeline[배포 파이프라인]
    Pipeline -- 배포 모듈 트리거 --> LaTeX[LaTeX 모듈] -- 컴파일 --> PDF[PDF]
    Pipeline -- 배포 모듈 트리거 --> LinkedInAPI[LinkedIn API 모듈] -- 프로필 수정 --> LinkedIn[LinkedIn]
    Pipeline -- 배포 모듈 트리거 --> NotionAPI[어떤 예쁜 모듈] -- 페이지 수정 --> Notion[Notion]
    Pipeline -- 배포 모듈 트리거 --> ...[...] -- 배포 --> ..[...]

    subgraph cvMax
        YAML
        Pipeline
        subgraph modules
            LaTeX[LaTeX 모듈]
            LinkedInAPI[LinkedIn API 모듈]
            NotionAPI[어떤 예쁜 모듈]
            ...[...]
        end
    end
```

# Milestones
Here's my plan to make this happen:
> I work on this whenever I feel like it, so I've set pretty conservative estimates.

```mermaid
gantt
    title Milestones for cvMax
    dateFormat  YYYY-MM-DD
    axisFormat  %Y-%m-%d
    tickInterval 2weaks

    %% =========================
    %% Milestones
    %% =========================
    section Milestones
    Project Started                  :milestone, start, 2025-11-14, 0d
    First Module Usable            :milestone, first-module, 2025-11-30, 0d
    Core Pipeline Working!            :milestone, after pipeline-core, 2025-12-10, 0d
    OK to let someone use it            :milestone, release-mvp, 2025-12-31, 0d


    %% =========================
    %% Modules
    %% =========================
    section Modules
    Typst (replace LaTeX) Module for Proof of Concept        :active, typst-module, after start, 14d
    LinkedIn API Module              :active, linkedin-module, after pipeline-core, 14d

    %% =========================
    %% Foundation
    %% =========================
    section Foundation
    Architecture Design       :active, arch-design, after typst-module, 5d
    Pipeline Core (Use Github Action)     :active, pipeline-core, after arch-design, 3d

    %% =========================
    %% Polish
    %% =========================
    section Polish
    Testing & Examples               :active, testing, after start, until release-mvp
    Documentation & User Guide        :active, docs, after linkedin-module, until release-mvp
```

# Ideas
While developing this, I came up with some features that would be cool to have. Maybe I'll add them to the milestones later.
* Import from existing sources (Github, LinkedIn, Notion, etc.) into YAML for fast initialization
* Use deployment modules made by others (think VSCode Extension)
* Since managing YAML means creating a Single Source of Truth (SSoT) for career history, maybe it could be used as a foundation to have AI write cover letters and other documents?
* A lot of people aren't comfortable editing YAML, so providing a GUI might be nice
* What if I offer YAML storage as a paid service?