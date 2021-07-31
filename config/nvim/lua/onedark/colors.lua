local colors = {
        black = { '#17191E', '#0E1013', '#151820', '#0C0E15', '#191A1C', '#101012' },
        white = { '#C3CCDC', '#C3CCDC', '#C3CCDC', '#C3CCDC', '#C3CCDC', '#C3CCDC' },
           bg = { '#1E2127', '#1E2127', '#1E2127', '#1E2127', '#1E2127', '#1E2127' },
          bg0 = { '#282C34', '#1F2329', '#242B38', '#1A212E', '#2C2D30', '#232326' },
          bg1 = { '#31353F', '#282C34', '#2D3343', '#21283B', '#35373B', '#2C2D31' },
          bg2 = { '#393F4A', '#30363F', '#343E4F', '#283347', '#3E4045', '#35363B' },
          bg3 = { '#3B3F4C', '#323641', '#363C51', '#2A324A', '#404247', '#37383D' },
         bg_d = { '#21252B', '#181B20', '#1E242E', '#141B24', '#242628', '#1B1C1E' },
      bg_blue = { '#73B8F1', '#61AFEF', '#6DB9F7', '#54B0FD', '#79B7EB', '#68AEE8' },
     bg_green = { '#B2D77C', '#B2D77C', '#B2D77C', '#B2D77C', '#B2D77C', '#B2D77C' },
    bg_yellow = { '#EBD09C', '#E8C88C', '#F0D197', '#F2CC81', '#E6CFA1', '#E2C792' },
           fg = { '#ABB2BF', '#A0A8B7', '#A5B0C5', '#93A4C3', '#B1B4B9', '#A7AAB0' },
      magenta = { '#D16D9E', '#D16D9E', '#D16D9E', '#D16D9E', '#D16D9E', '#D16D9E' },
       purple = { '#C678DD', '#BF68D9', '#CA72E4', '#C75AE8', '#C27FD7', '#BB70D2' },
        green = { '#98C379', '#8EBD6B', '#97CA72', '#8BCD5B', '#99BC80', '#8FB573' },
       orange = { '#D19A66', '#CC9057', '#D99A5E', '#DD9046', '#C99A6E', '#C49060' },
         blue = { '#61AFEF', '#61AFEF', '#5AB0F6', '#41A7FC', '#68AEE8', '#57A5E5' },
       yellow = { '#E5C07B', '#E2B86B', '#EBC275', '#EFBD5D', '#DFBE81', '#DBB671' },
         cyan = { '#56B6C2', '#48B0BD', '#4DBDCB', '#34BFD0', '#5FAFB9', '#51A8B3' },
          red = { '#E06C75', '#E06C75', '#EF5F6B', '#F65866', '#E16D77', '#DE5D68' },
   light_grey = { '#8F96A5', '#8F96A5', '#8F96A5', '#8F96A5', '#8F96A5', '#8F96A5' },
         grey = { '#5C6370', '#535965', '#546178', '#455574', '#646568', '#5A5B5E' },
    dark_cyan = { '#2B6F77', '#266269', '#25747D', '#1B6A73', '#316A71', '#2B5D63' },
     dark_red = { '#993939', '#8B3434', '#A13131', '#992525', '#914141', '#833B3B' },
  dark_yellow = { '#93691D', '#835D1A', '#9A6B16', '#8F610D', '#8C6724', '#7C5C20' },
  dark_purple = { '#8A3FA0', '#7E3992', '#8F36A9', '#862AA1', '#854897', '#79428A' },
     diff_add = { '#31392B', '#272E23', '#303D27', '#27341C', '#32352F', '#282B26' },
  diff_delete = { '#382B2C', '#2D2223', '#3C2729', '#331C1E', '#342F2F', '#2A2626' },
  diff_change = { '#1C3448', '#172A3A', '#18344C', '#102B40', '#203444', '#1A2A37' },
    diff_text = { '#2C5372', '#274964', '#265478', '#1C4A6E', '#32526C', '#2C485F' },
     diff_red = { '#773440', '#773440', '#773440', '#773440', '#773440', '#773440' },
   diff_green = { '#587738', '#587738', '#587738', '#587738', '#587738', '#587738' },
    diff_blue = { '#5574A3', '#5574A3', '#5574A3', '#5574A3', '#5574A3', '#5574A3' },
  pale_purple = { '#7199EE', '#7199EE', '#7199EE', '#7199EE', '#7199EE', '#7199EE' },
}


local styles = { dark = 1, darker = 2, cool = 3, deep = 4, warm = 5, warmer = 6 }

local function select_colors()
    index = styles[vim.g.onedark_style]
    local selected = {}
    for k, v in pairs(colors) do selected[k] = v[index] end
		selected['none'] = 'NONE'
    return selected
end

return select_colors()
