# cvMax
## Objective
cvMax lets you
* manage your CV in a single file, and
* automatically deploy it to whatever format you need without any extra work.

So instead of managing your CV like this:
```mermaid
flowchart TD
    CV[CV Change Occurs]
    CV -- Update Page --> Notion[Notion]
    CV -- Update Profile --> LinkedIn[LinkedIn]
    CV -- Code Change --> LaTeX[LaTeX] --Compile--> PDF[PDF]
    CV -- ... --> ...[...]
```

I'm changing it to this to make everyone's life easier:
```mermaid
flowchart TD
    CV[CV Change Occurs]
    CV -- Edit File --> YAML[YAML]
    YAML -- Detect File Change --> Pipeline[Deployment Pipeline]
    Pipeline -- Trigger Module --> LaTeX[LaTeX Module] -- Compile --> PDF[PDF]
    Pipeline -- Trigger Module --> LinkedInAPI[LinkedIn API Module] -- Update Profile --> LinkedIn[LinkedIn]
    Pipeline -- Trigger Module --> NotionAPI[Some Nice Module] -- Update Page --> Notion[Notion]
    Pipeline -- Trigger Module --> ...[...] -- Deploy --> ..[...]

    subgraph cvMax
        YAML
        Pipeline
        subgraph modules
            LaTeX[LaTeX Module]
            LinkedInAPI[LinkedIn API Module]
            NotionAPI[Some Nice Module]
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