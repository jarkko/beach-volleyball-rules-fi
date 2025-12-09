// Utility functions for the Rulebook

#let fivb-blue = rgb("#003399")

// Helper for inline numbered rules (e.g. 21.2.3)
// Creates a label <rule-21.2.3> and displays it boldly.
#let r(number, body) = {
  let lbl = label("rule-" + number)
  par(hanging-indent: 1em)[
    #text(weight: "bold")[#number] #lbl #h(0.5em) #body
  ]
}

// Helper for Rules (Main headers like 1, 2, 3...)
#let rule(number, title, body) = {
  let lbl = label("rule-" + number)
  block(above: 2em, below: 1em, breakable: false)[
    #box(width: 100%, stroke: (bottom: 1pt + fivb-blue))[
      #text(weight: "bold", size: 1.2em, fill: fivb-blue)[#number #title] #lbl
    ]
    #v(0.5em)
    #body
  ]
}

// Helper for Sub-rules (1.1, 1.2...)
#let subrule(number, title, body) = {
  let lbl = label("rule-" + number)
  block(above: 1.2em, below: 1em)[
    #text(weight: "bold")[#number #title] #lbl
    #v(0.3em)
    #body
  ]
}

// Helper for Diagrams
#let diagram(number, title, body) = {
  let lbl = label("rule-D" + number)
  block(above: 2em, below: 1em, breakable: false)[
    #box(width: 100%, stroke: (bottom: 1pt + fivb-blue))[
      #text(weight: "bold", size: 1.2em, fill: fivb-blue)[KAAVIO #number: #title] #lbl
    ]
    #v(0.5em)
    #body
  ]
}

// Internal helper to generate link objects
#let link_rules(refs, enable_links: true) = {
  let refs_list = if type(refs) == "string" { (refs,) } else { refs }
  let links = ()

  for r in refs_list {
    let clean-r = r.trim() // Trim whitespace

    if enable_links {
        let target-lbl = ""
        if clean-r.starts-with("D") {
          // Handle Diagram refs
          let parts = clean-r.split(" ")
          let d-num = parts.at(0).trim("D")
          if clean-r.contains("a") or clean-r.contains("b") {
             if clean-r.contains("a") { d-num = "4a" } // Heuristic, might need refinement
             else if clean-r.contains("b") { d-num = "4b" }
             else { d-num = clean-r.split(" ").at(0).trim("D") }
             target-lbl = "rule-D" + d-num
          } else {
             target-lbl = "rule-D" + parts.at(0).trim("D")
          }
        } else {
          // Regular rule ref
          target-lbl = "rule-" + clean-r
        }
        links.push(link(label(target-lbl))[#text(fill: fivb-blue)[#clean-r]])
    } else {
        // Just text, no link
        links.push(text(fill: fivb-blue)[#clean-r])
    }
  }
  links.join(", ")
}

// Helper for references (See Rules...) - Margin version
#let refs(..args) = {
  let refs_list = args.pos()

  // Place in the right margin
  place(
    right,
    dx: 4.5cm, // Move into the 5cm margin (0.5cm padding from text block)
    block(width: 4cm)[
      #set align(left)
      #set text(size: 0.75em, weight: "bold", fill: fivb-blue)
      #link_rules(refs_list, enable_links: true)
    ]
  )
}

// Helper for Casebook Cases
#let case(number, question, ruling, rules) = {
  block(breakable: true, stroke: (left: 2pt + fivb-blue), inset: (left: 1em), below: 2em)[
    #text(weight: "bold", fill: fivb-blue, size: 1.1em)[Tapaus #number]
    #v(0.5em)
    #question
    #v(0.8em)
    #text(weight: "bold")[Päätös]
    #ruling
    #if rules != none {
       v(0.5em)
       // Disable links for Casebook as Rules are in a separate doc
       text(style: "italic", size: 0.9em)[Säännöt: #link_rules(rules, enable_links: false)]
    }
  ]
}
