return {
  "Djancyp/better-comments.nvim",
  config = function()
    require("better-comment").Setup({
      tags = {
        {
          name = "TODO",
          fg = "#FFA500",
          bg = "",
          bold = true,
          virtual_text = "",
        },
        {
          name = "!",
          fg = "#f44747",
          bg = "",
          bold = true,
          virtual_text = "",
        },
        {
          name = "?",
          fg = "#0a7aca",
          bg = "",
          bold = true,
          virtual_text = "",
        },
        {
          name = "*",
          fg = "#98C379",
          bg = "",
          bold = true,
          virtual_text = "",
        }
      }
    })
  end
}
