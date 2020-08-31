import $ from 'jquery'

const initPopover = () => {
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
});

$(function () {
  $('[data-toggle="popover"]').popover()
})

}

export { initPopover }
