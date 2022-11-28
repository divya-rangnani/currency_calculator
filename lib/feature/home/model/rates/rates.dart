class Rates {
  Rates({
      this.aed, 
      this.afn, 
      this.all, 
      this.amd, 
      this.ang, 
      this.aoa, 
      this.ars, 
      this.aud, 
      this.awg, 
      this.azn, 
      this.bam, 
      this.bbd, 
      this.bdt, 
      this.bgn, 
      this.bhd, 
      this.bif, 
      this.bmd, 
      this.bnd, 
      this.bob, 
      this.brl, 
      this.bsd, 
      this.btc, 
      this.btn, 
      this.bwp, 
      this.byn, 
      this.byr, 
      this.bzd, 
      this.cad, 
      this.cdf, 
      this.chf, 
      this.clf, 
      this.clp, 
      this.cny, 
      this.cop, 
      this.crc, 
      this.cuc, 
      this.cup, 
      this.cve, 
      this.czk, 
      this.djf, 
      this.dkk, 
      this.dop, 
      this.dzd, 
      this.egp, 
      this.ern, 
      this.etb, 
      this.eur, 
      this.fjd, 
      this.fkp, 
      this.gbp, 
      this.gel, 
      this.ggp, 
      this.ghs, 
      this.gip, 
      this.gmd, 
      this.gnf, 
      this.gtq, 
      this.gyd, 
      this.hkd, 
      this.hnl, 
      this.hrk, 
      this.htg, 
      this.huf, 
      this.idr, 
      this.ils, 
      this.imp, 
      this.inr, 
      this.iqd, 
      this.irr, 
      this.isk, 
      this.jep, 
      this.jmd, 
      this.jod, 
      this.jpy, 
      this.kes, 
      this.kgs, 
      this.khr, 
      this.kmf, 
      this.kpw, 
      this.krw, 
      this.kwd, 
      this.kyd, 
      this.kzt, 
      this.lak, 
      this.lbp, 
      this.lkr, 
      this.lrd, 
      this.lsl, 
      this.ltl, 
      this.lvl, 
      this.lyd, 
      this.mad, 
      this.mdl, 
      this.mga, 
      this.mkd, 
      this.mmk, 
      this.mnt, 
      this.mop, 
      this.mro, 
      this.mur, 
      this.mvr, 
      this.mwk, 
      this.mxn, 
      this.myr, 
      this.mzn, 
      this.nad, 
      this.ngn, 
      this.nio, 
      this.nok, 
      this.npr, 
      this.nzd, 
      this.omr, 
      this.pab, 
      this.pen, 
      this.pgk, 
      this.php, 
      this.pkr, 
      this.pln, 
      this.pyg, 
      this.qar, 
      this.ron, 
      this.rsd, 
      this.rub, 
      this.rwf, 
      this.sar, 
      this.sbd, 
      this.scr, 
      this.sdg, 
      this.sek, 
      this.sgd, 
      this.shp, 
      this.sll, 
      this.sos, 
      this.srd, 
      this.std, 
      this.svc, 
      this.syp, 
      this.szl, 
      this.thb, 
      this.tjs, 
      this.tmt, 
      this.tnd, 
      this.top, 
      this.tryy,
      this.ttd, 
      this.twd, 
      this.tzs, 
      this.uah, 
      this.ugx, 
      this.usd, 
      this.uyu, 
      this.uzs, 
      this.vef, 
      this.vnd, 
      this.vuv, 
      this.wst, 
      this.xaf, 
      this.xag, 
      this.xau, 
      this.xcd, 
      this.xdr, 
      this.xof, 
      this.xpf, 
      this.yer, 
      this.zar, 
      this.zmk, 
      this.zmw, 
      this.zwl,});

  Rates.fromJson(dynamic json) {
    aed = json['AED'];
    afn = json['AFN'];
    all = json['ALL'];
    amd = json['AMD'];
    ang = json['ANG'];
    aoa = json['AOA'];
    ars = json['ARS'];
    aud = json['AUD'];
    awg = json['AWG'];
    azn = json['AZN'];
    bam = json['BAM'];
    bbd = json['BBD'];
    bdt = json['BDT'];
    bgn = json['BGN'];
    bhd = json['BHD'];
    bif = json['BIF'];
    bmd = json['BMD'];
    bnd = json['BND'];
    bob = json['BOB'];
    brl = json['BRL'];
    bsd = json['BSD'];
    btc = json['BTC'];
    btn = json['BTN'];
    bwp = json['BWP'];
    byn = json['BYN'];
    byr = json['BYR'];
    bzd = json['BZD'];
    cad = json['CAD'];
    cdf = json['CDF'];
    chf = json['CHF'];
    clf = json['CLF'];
    clp = json['CLP'];
    cny = json['CNY'];
    cop = json['COP'];
    crc = json['CRC'];
    cuc = json['CUC'];
    cup = json['CUP'];
    cve = json['CVE'];
    czk = json['CZK'];
    djf = json['DJF'];
    dkk = json['DKK'];
    dop = json['DOP'];
    dzd = json['DZD'];
    egp = json['EGP'];
    ern = json['ERN'];
    etb = json['ETB'];
    eur = json['EUR'];
    fjd = json['FJD'];
    fkp = json['FKP'];
    gbp = json['GBP'];
    gel = json['GEL'];
    ggp = json['GGP'];
    ghs = json['GHS'];
    gip = json['GIP'];
    gmd = json['GMD'];
    gnf = json['GNF'];
    gtq = json['GTQ'];
    gyd = json['GYD'];
    hkd = json['HKD'];
    hnl = json['HNL'];
    hrk = json['HRK'];
    htg = json['HTG'];
    huf = json['HUF'];
    idr = json['IDR'];
    ils = json['ILS'];
    imp = json['IMP'];
    inr = json['INR'];
    iqd = json['IQD'];
    irr = json['IRR'];
    isk = json['ISK'];
    jep = json['JEP'];
    jmd = json['JMD'];
    jod = json['JOD'];
    jpy = json['JPY'];
    kes = json['KES'];
    kgs = json['KGS'];
    khr = json['KHR'];
    kmf = json['KMF'];
    kpw = json['KPW'];
    krw = json['KRW'];
    kwd = json['KWD'];
    kyd = json['KYD'];
    kzt = json['KZT'];
    lak = json['LAK'];
    lbp = json['LBP'];
    lkr = json['LKR'];
    lrd = json['LRD'];
    lsl = json['LSL'];
    ltl = json['LTL'];
    lvl = json['LVL'];
    lyd = json['LYD'];
    mad = json['MAD'];
    mdl = json['MDL'];
    mga = json['MGA'];
    mkd = json['MKD'];
    mmk = json['MMK'];
    mnt = json['MNT'];
    mop = json['MOP'];
    mro = json['MRO'];
    mur = json['MUR'];
    mvr = json['MVR'];
    mwk = json['MWK'];
    mxn = json['MXN'];
    myr = json['MYR'];
    mzn = json['MZN'];
    nad = json['NAD'];
    ngn = json['NGN'];
    nio = json['NIO'];
    nok = json['NOK'];
    npr = json['NPR'];
    nzd = json['NZD'];
    omr = json['OMR'];
    pab = json['PAB'];
    pen = json['PEN'];
    pgk = json['PGK'];
    php = json['PHP'];
    pkr = json['PKR'];
    pln = json['PLN'];
    pyg = json['PYG'];
    qar = json['QAR'];
    ron = json['RON'];
    rsd = json['RSD'];
    rub = json['RUB'];
    rwf = json['RWF'];
    sar = json['SAR'];
    sbd = json['SBD'];
    scr = json['SCR'];
    sdg = json['SDG'];
    sek = json['SEK'];
    sgd = json['SGD'];
    shp = json['SHP'];
    sll = json['SLL'];
    sos = json['SOS'];
    srd = json['SRD'];
    std = json['STD'];
    svc = json['SVC'];
    syp = json['SYP'];
    szl = json['SZL'];
    thb = json['THB'];
    tjs = json['TJS'];
    tmt = json['TMT'];
    tnd = json['TND'];
    top = json['TOP'];
    tryy = json['TRY'];
    ttd = json['TTD'];
    twd = json['TWD'];
    tzs = json['TZS'];
    uah = json['UAH'];
    ugx = json['UGX'];
    usd = json['USD'];
    uyu = json['UYU'];
    uzs = json['UZS'];
    vef = json['VEF'];
    vnd = json['VND'];
    vuv = json['VUV'];
    wst = json['WST'];
    xaf = json['XAF'];
    xag = json['XAG'];
    xau = json['XAU'];
    xcd = json['XCD'];
    xdr = json['XDR'];
    xof = json['XOF'];
    xpf = json['XPF'];
    yer = json['YER'];
    zar = json['ZAR'];
    zmk = json['ZMK'];
    zmw = json['ZMW'];
    zwl = json['ZWL'];
  }
  num? aed;
  num? afn;
  num? all;
  num? amd;
  num? ang;
  num? aoa;
  num? ars;
  num? aud;
  num? awg;
  num? azn;
  num? bam;
  num? bbd;
  num? bdt;
  num? bgn;
  num? bhd;
  num? bif;
  num? bmd;
  num? bnd;
  num? bob;
  num? brl;
  num? bsd;
  num? btc;
  num? btn;
  num? bwp;
  num? byn;
  num? byr;
  num? bzd;
  num? cad;
  num? cdf;
  num? chf;
  num? clf;
  num? clp;
  num? cny;
  num? cop;
  num? crc;
  num? cuc;
  num? cup;
  num? cve;
  num? czk;
  num? djf;
  num? dkk;
  num? dop;
  num? dzd;
  num? egp;
  num? ern;
  num? etb;
  num? eur;
  num? fjd;
  num? fkp;
  num? gbp;
  num? gel;
  num? ggp;
  num? ghs;
  num? gip;
  num? gmd;
  num? gnf;
  num? gtq;
  num? gyd;
  num? hkd;
  num? hnl;
  num? hrk;
  num? htg;
  num? huf;
  num? idr;
  num? ils;
  num? imp;
  num? inr;
  num? iqd;
  num? irr;
  num? isk;
  num? jep;
  num? jmd;
  num? jod;
  num? jpy;
  num? kes;
  num? kgs;
  num? khr;
  num? kmf;
  num? kpw;
  num? krw;
  num? kwd;
  num? kyd;
  num? kzt;
  num? lak;
  num? lbp;
  num? lkr;
  num? lrd;
  num? lsl;
  num? ltl;
  num? lvl;
  num? lyd;
  num? mad;
  num? mdl;
  num? mga;
  num? mkd;
  num? mmk;
  num? mnt;
  num? mop;
  num? mro;
  num? mur;
  num? mvr;
  num? mwk;
  num? mxn;
  num? myr;
  num? mzn;
  num? nad;
  num? ngn;
  num? nio;
  num? nok;
  num? npr;
  num? nzd;
  num? omr;
  num? pab;
  num? pen;
  num? pgk;
  num? php;
  num? pkr;
  num? pln;
  num? pyg;
  num? qar;
  num? ron;
  num? rsd;
  num? rub;
  num? rwf;
  num? sar;
  num? sbd;
  num? scr;
  num? sdg;
  num? sek;
  num? sgd;
  num? shp;
  num? sll;
  num? sos;
  num? srd;
  num? std;
  num? svc;
  num? syp;
  num? szl;
  num? thb;
  num? tjs;
  num? tmt;
  num? tnd;
  num? top;
  num? tryy;
  num? ttd;
  num? twd;
  num? tzs;
  num? uah;
  num? ugx;
  num? usd;
  num? uyu;
  num? uzs;
  num? vef;
  num? vnd;
  num? vuv;
  num? wst;
  num? xaf;
  num? xag;
  num? xau;
  num? xcd;
  num? xdr;
  num? xof;
  num? xpf;
  num? yer;
  num? zar;
  num? zmk;
  num? zmw;
  num? zwl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['AED'] = aed;
    map['AFN'] = afn;
    map['ALL'] = all;
    map['AMD'] = amd;
    map['ANG'] = ang;
    map['AOA'] = aoa;
    map['ARS'] = ars;
    map['AUD'] = aud;
    map['AWG'] = awg;
    map['AZN'] = azn;
    map['BAM'] = bam;
    map['BBD'] = bbd;
    map['BDT'] = bdt;
    map['BGN'] = bgn;
    map['BHD'] = bhd;
    map['BIF'] = bif;
    map['BMD'] = bmd;
    map['BND'] = bnd;
    map['BOB'] = bob;
    map['BRL'] = brl;
    map['BSD'] = bsd;
    map['BTC'] = btc;
    map['BTN'] = btn;
    map['BWP'] = bwp;
    map['BYN'] = byn;
    map['BYR'] = byr;
    map['BZD'] = bzd;
    map['CAD'] = cad;
    map['CDF'] = cdf;
    map['CHF'] = chf;
    map['CLF'] = clf;
    map['CLP'] = clp;
    map['CNY'] = cny;
    map['COP'] = cop;
    map['CRC'] = crc;
    map['CUC'] = cuc;
    map['CUP'] = cup;
    map['CVE'] = cve;
    map['CZK'] = czk;
    map['DJF'] = djf;
    map['DKK'] = dkk;
    map['DOP'] = dop;
    map['DZD'] = dzd;
    map['EGP'] = egp;
    map['ERN'] = ern;
    map['ETB'] = etb;
    map['EUR'] = eur;
    map['FJD'] = fjd;
    map['FKP'] = fkp;
    map['GBP'] = gbp;
    map['GEL'] = gel;
    map['GGP'] = ggp;
    map['GHS'] = ghs;
    map['GIP'] = gip;
    map['GMD'] = gmd;
    map['GNF'] = gnf;
    map['GTQ'] = gtq;
    map['GYD'] = gyd;
    map['HKD'] = hkd;
    map['HNL'] = hnl;
    map['HRK'] = hrk;
    map['HTG'] = htg;
    map['HUF'] = huf;
    map['IDR'] = idr;
    map['ILS'] = ils;
    map['IMP'] = imp;
    map['INR'] = inr;
    map['IQD'] = iqd;
    map['IRR'] = irr;
    map['ISK'] = isk;
    map['JEP'] = jep;
    map['JMD'] = jmd;
    map['JOD'] = jod;
    map['JPY'] = jpy;
    map['KES'] = kes;
    map['KGS'] = kgs;
    map['KHR'] = khr;
    map['KMF'] = kmf;
    map['KPW'] = kpw;
    map['KRW'] = krw;
    map['KWD'] = kwd;
    map['KYD'] = kyd;
    map['KZT'] = kzt;
    map['LAK'] = lak;
    map['LBP'] = lbp;
    map['LKR'] = lkr;
    map['LRD'] = lrd;
    map['LSL'] = lsl;
    map['LTL'] = ltl;
    map['LVL'] = lvl;
    map['LYD'] = lyd;
    map['MAD'] = mad;
    map['MDL'] = mdl;
    map['MGA'] = mga;
    map['MKD'] = mkd;
    map['MMK'] = mmk;
    map['MNT'] = mnt;
    map['MOP'] = mop;
    map['MRO'] = mro;
    map['MUR'] = mur;
    map['MVR'] = mvr;
    map['MWK'] = mwk;
    map['MXN'] = mxn;
    map['MYR'] = myr;
    map['MZN'] = mzn;
    map['NAD'] = nad;
    map['NGN'] = ngn;
    map['NIO'] = nio;
    map['NOK'] = nok;
    map['NPR'] = npr;
    map['NZD'] = nzd;
    map['OMR'] = omr;
    map['PAB'] = pab;
    map['PEN'] = pen;
    map['PGK'] = pgk;
    map['PHP'] = php;
    map['PKR'] = pkr;
    map['PLN'] = pln;
    map['PYG'] = pyg;
    map['QAR'] = qar;
    map['RON'] = ron;
    map['RSD'] = rsd;
    map['RUB'] = rub;
    map['RWF'] = rwf;
    map['SAR'] = sar;
    map['SBD'] = sbd;
    map['SCR'] = scr;
    map['SDG'] = sdg;
    map['SEK'] = sek;
    map['SGD'] = sgd;
    map['SHP'] = shp;
    map['SLL'] = sll;
    map['SOS'] = sos;
    map['SRD'] = srd;
    map['STD'] = std;
    map['SVC'] = svc;
    map['SYP'] = syp;
    map['SZL'] = szl;
    map['THB'] = thb;
    map['TJS'] = tjs;
    map['TMT'] = tmt;
    map['TND'] = tnd;
    map['TOP'] = top;
    map['TRY'] = tryy;
    map['TTD'] = ttd;
    map['TWD'] = twd;
    map['TZS'] = tzs;
    map['UAH'] = uah;
    map['UGX'] = ugx;
    map['USD'] = usd;
    map['UYU'] = uyu;
    map['UZS'] = uzs;
    map['VEF'] = vef;
    map['VND'] = vnd;
    map['VUV'] = vuv;
    map['WST'] = wst;
    map['XAF'] = xaf;
    map['XAG'] = xag;
    map['XAU'] = xau;
    map['XCD'] = xcd;
    map['XDR'] = xdr;
    map['XOF'] = xof;
    map['XPF'] = xpf;
    map['YER'] = yer;
    map['ZAR'] = zar;
    map['ZMK'] = zmk;
    map['ZMW'] = zmw;
    map['ZWL'] = zwl;
    return map;
  }

}